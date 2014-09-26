// QChartJs.js ---
//
// Author: Shuirna Wang
//
//
import QtQuick 2.0

import "Chart.js" as Chart

Canvas {
    id: canvas
    width: 800
    height: 400
    property var chart
    property var chartRenderHandler
    property string chartType
    property double chartAnimationProgress : 0.1
    property bool animation: true
    property alias chartAnimationEasing: chartAnimator.easing.type;
    property alias chartAnimationDuration: chartAnimator.duration;
    property var chartData
    property var chartOptions: ({})
    property QtObject paintType: QtObject {
        property string type: "INIT"
    }

    function requestInitPaint() {
        paintType.type = "INIT";
        canvas.requestPaint();
    }

    function requestToolTipPaint() {
        paintType.type = "TOOLTIP";
        canvas.requestPaint();
    }

    onPaint: {
        if(!chartRenderHandler) {
            chartRenderHandler = Chart.newChartInstance(getContext("2d"), chartData, chartOptions, chartType);
            if(animation) {
                chartAnimator.start();
            } else {
                chartAnimationProgress = 1;
            }
        }
        if(paintType.type === "INIT") {
            chartRenderHandler.draw(chartAnimationProgress);
        } else if(paintType.type === "TOOLTIP") {
            chartRenderHandler.bindMouseEvent(event.mouseEvent);
        } else {
            console.log("Not supported paint type: " + paintType.type);
        }
    }

    onChartAnimationProgressChanged: {
        requestInitPaint();
    }

    MouseArea {
        id: event
        anchors.fill: parent
        hoverEnabled: true
        enabled: true
        property QtObject mouseEvent: QtObject {
            property int left: 0
            property int top: 0
            property int clientX: 0
            property int clientY: 0
            property string type: ""
        }
        onPositionChanged: {
            mouseEvent.type = "mousemove"
            mouseEvent.clientX = mouse.x;
            mouseEvent.clientY = mouse.y;
            mouseEvent.left = 0;
            mouseEvent.top = 0;
            canvas.requestToolTipPaint();
        }
        onExited: {
            mouseEvent.type = "mouseout"
            mouseEvent.clientX = 0;
            mouseEvent.clientY = 0;
            mouseEvent.left = 0;
            mouseEvent.top = 0;
            canvas.requestToolTipPaint();
        }
    }

    PropertyAnimation {
        id: chartAnimator;
        target: canvas;
        property: "chartAnimationProgress";
        alwaysRunToEnd: true
        to: 1;
        duration: 500;
        easing.type: Easing.InOutElastic;
    }
}
