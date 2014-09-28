# QMLChartJs
==========

QML Chart using chart.js(version: "1.0.1-beta.4")

This Project borrow ideas from(https://github.com/jwintz/qchart.js)

For a quick check, here is a screenshot:
![Screenshot](screenshot/screenshot.png)

## Usage
```QML

 QChartJs {
        id: chart_line
        width: 300 
        height: 300 
        chartType: ChartTypes.QChartJSTypes.LINE
        chartData: ChartsData.ChartLineData
        animation: true
        chartAnimationEasing: Easing.InOutElastic;
        chartAnimationDuration: 2000;
    }
``

Check out main.qml for more details.

## Dependencies
Qt >= 5.0

