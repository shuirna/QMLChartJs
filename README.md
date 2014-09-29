# QMLChartJs
==========

QML Chart module, using chart.js(base on version: "1.0.1-beta.4") to render charts on QML canvas.

This Project borrow ideas from(https://github.com/jwintz/qchart.js)

For a quick check, here is a screenshot:
![Screenshot](screenshot/screenshot.png)

For Support features, please check(http://www.chartjs.org/)

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

```

Check out main.qml for more details.

## Dependencies
Qt >= 5.0

==========
