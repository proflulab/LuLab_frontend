// import 'dart:math';
//
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
//
// class ChartTestPage extends StatelessWidget {
//   const ChartTestPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("chart_flutter")),
//       body: Column(children: [Container(height: 240, child: _simpleLine())]),
//     );
//   }
//
//   Widget _simpleLine() {
//     var random = Random();
//
//     var data = [
//       LinearSales(0, random.nextInt(1020)),
//       LinearSales(1, random.nextInt(170)),
//       LinearSales(2, random.nextInt(1070)),
//       LinearSales(3, random.nextInt(30)),
//     ];
//     var data1 = [
//       LinearSales(0, random.nextInt(100)),
//       LinearSales(1, random.nextInt(100)),
//       LinearSales(2, random.nextInt(80)),
//       LinearSales(3, random.nextInt(70)),
//     ];
//     var data2 = [
//       LinearSales(0, random.nextInt(10)),
//       LinearSales(1, random.nextInt(1)),
//       LinearSales(2, random.nextInt(100)),
//       LinearSales(3, random.nextInt(110)),
//     ];
//     var data3 = [
//       LinearSales(0, random.nextInt(170)),
//       LinearSales(1, random.nextInt(100)),
//       LinearSales(2, random.nextInt(10)),
//       LinearSales(3, random.nextInt(100)),
//     ];
//
//     // var seriesList = [
//     //   charts.Series<LinearSales, int>(
//     //     id: 'Sales',
//     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//     //     domainFn: (LinearSales sales, _) => sales.year,
//     //     measureFn: (LinearSales sales, _) => sales.sales,
//     //     data: data,
//     //   )
//     // ];
//     // var seriesList = [
//     //   charts.Series<LinearSales, int>(
//     //     id: 'Sales',
//     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//     //     domainFn: (LinearSales sales, _) => sales.year,
//     //     measureFn: (LinearSales sales, _) => sales.sales,
//     //     dashPatternFn: (_, __) => [8, 2, 4, 2],
//     //     data: data,
//     //   )
//     // ];
//     var seriesList = [
//       charts.Series<LinearSales, int>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFFE41E31)),
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         dashPatternFn: (_, __) => [8, 2, 4, 2],
//         data: data1,
//       ),
//       charts.Series<LinearSales, int>(
//         id: 'User',
//         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF13A331)),
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         // dashPatternFn: (_, __) => [8, 2, 4, 2],
//         data: data2,
//       ),
//       charts.Series<LinearSales, int>(
//         id: 'Dart',
//         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF6300A1)),
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         // dashPatternFn: (_, __) => [8, 2, 4, 2],
//         data: data3,
//       )
//     ];
//
//     return charts.LineChart(seriesList,
//         animate: true,
//         defaultRenderer: charts.LineRendererConfig(
//           // 圆点大小
//           radiusPx: 5.0,
//           stacked: false,
//           // 线的宽度
//           strokeWidthPx: 2.0,
//           // 是否显示线
//           includeLine: true,
//           // 是否显示圆点
//           includePoints: true,
//           // 是否显示包含区域
//           includeArea: true,
//           // 区域颜色透明度 0.0-1.0
//           areaOpacity: 0.2,
//         ));
//   }
// }
//
// class LinearSales {
//   final int year;
//   final int sales;
//
//   LinearSales(this.year, this.sales);
// }
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartTestPage extends StatelessWidget {
  const ChartTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chart_flutter")),
      body: Column(children: [Container(height: 240, child: _simpleBar())]),
    );
  }

  Widget _simpleBar() {
    var random = Random();

    var data = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];
    var data1 = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];
    var data2 = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];

    // var seriesList = [
    //   charts.Series<OrdinalSales, String>(
    //     id: 'Sales',
    //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    //     domainFn: (OrdinalSales sales, _) => sales.year,
    //     measureFn: (OrdinalSales sales, _) => sales.sales,
    //     data: data,
    //   )
    // ];
    var seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data1,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data2,
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
