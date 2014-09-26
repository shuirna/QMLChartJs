import "."
import QtQuick 2.0
import QtQuick.Window 2.1
import "QMLChartData.js" as ChartsData
import "QChartJsTypes.js" as ChartTypes

Window {
    visible: true
    property int chart_width: 300;
    property int chart_height: 300;
    property int chart_spacing: 20;
    property int text_height: 80;
    property int row_height: 8;

    color: "#ffffff";
    width: chart_width*3 + 2*chart_spacing;
    height: chart_height*2 + chart_spacing + 2*row_height + text_height;

  Grid {

    id: layout;

    x: 0;
    y: 0;

    width: parent.width;
    height: parent.height - 80;

    columns: 3;
    spacing: chart_spacing;

    QChartJs {
        id: chart_line
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.LINE
        chartData: ChartsData.ChartLineData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

    QChartJs {
        id: chart_bar
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.BAR
        chartData: ChartsData.ChartBarData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

    QChartJs {
        id: chart_doughnut
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.DOUGHNUT
        chartData: ChartsData.ChartDoughnutData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

    QChartJs {
        id: chart_pie
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.PIE
        chartData: ChartsData.ChartPieData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

    QChartJs {
        id: chart_polar
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.POLARAREA
        chartData: ChartsData.ChartPolarData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

    QChartJs {
        id: chart_radar
        width: chart_width
        height: chart_height
        chartType: ChartTypes.QChartJSTypes.RADAR
        chartData: ChartsData.ChartRadarData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }

  }
}
