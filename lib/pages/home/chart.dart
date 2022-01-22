//弹窗测试代码
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TanChuang extends StatefulWidget {
//   const TanChuang({Key? key}) : super(key: key);
//
//   @override
//   _TanChuangState createState() => _TanChuangState();
// }
//
// class _TanChuangState extends State<TanChuang> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       color: Colors.blue,
//       child: const Text('点我'),
//       onPressed: () {
//         showDialog<Null>(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             // return AlertDialog(
//             //   // title: const Text('标题'),
//             //   content: buildContent(context),
//             //   actions: <Widget>[
//             //     ElevatedButton(
//             //       child: const Text('确定'),
//             //       onPressed: () {
//             //         Navigator.of(context).pop();
//             //       },
//             //     ),
//             //   ],
//             // );
//             return new CupertinoAlertDialog(
//               content: SingleChildScrollView(
//                 child: ListBody(
//                   children: <Widget>[
//                     Text("IOS风格"),
//                     Text("是否要删除？"),
//                     Text("一旦删除数据不可恢复!")
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 CupertinoDialogAction(
//                   child: Text("确定"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 CupertinoDialogAction(
//                   child: Text("取消"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         ).then((val) {
//           print(val);
//         });
//       },
//     );
//   }
//表格测试
// // // import 'dart:math';
// // //
// // // import 'package:charts_flutter/flutter.dart' as charts;
// // // import 'package:flutter/material.dart';
// // //
// // // class ChartTestPage extends StatelessWidget {
// // //   const ChartTestPage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text("chart_flutter")),
// // //       body: Column(children: [Container(height: 240, child: _simpleLine())]),
// // //     );
// // //   }
// // //
// // //   Widget _simpleLine() {
// // //     var random = Random();
// // //
// // //     var data = [
// // //       LinearSales(0, random.nextInt(1020)),
// // //       LinearSales(1, random.nextInt(170)),
// // //       LinearSales(2, random.nextInt(1070)),
// // //       LinearSales(3, random.nextInt(30)),
// // //     ];
// // //     var data1 = [
// // //       LinearSales(0, random.nextInt(100)),
// // //       LinearSales(1, random.nextInt(100)),
// // //       LinearSales(2, random.nextInt(80)),
// // //       LinearSales(3, random.nextInt(70)),
// // //     ];
// // //     var data2 = [
// // //       LinearSales(0, random.nextInt(10)),
// // //       LinearSales(1, random.nextInt(1)),
// // //       LinearSales(2, random.nextInt(100)),
// // //       LinearSales(3, random.nextInt(110)),
// // //     ];
// // //     var data3 = [
// // //       LinearSales(0, random.nextInt(170)),
// // //       LinearSales(1, random.nextInt(100)),
// // //       LinearSales(2, random.nextInt(10)),
// // //       LinearSales(3, random.nextInt(100)),
// // //     ];
// // //
// // //     // var seriesList = [
// // //     //   charts.Series<LinearSales, int>(
// // //     //     id: 'Sales',
// // //     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
// // //     //     domainFn: (LinearSales sales, _) => sales.year,
// // //     //     measureFn: (LinearSales sales, _) => sales.sales,
// // //     //     data: data,
// // //     //   )
// // //     // ];
// // //     // var seriesList = [
// // //     //   charts.Series<LinearSales, int>(
// // //     //     id: 'Sales',
// // //     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
// // //     //     domainFn: (LinearSales sales, _) => sales.year,
// // //     //     measureFn: (LinearSales sales, _) => sales.sales,
// // //     //     dashPatternFn: (_, __) => [8, 2, 4, 2],
// // //     //     data: data,
// // //     //   )
// // //     // ];
// // //     var seriesList = [
// // //       charts.Series<LinearSales, int>(
// // //         id: 'Sales',
// // //         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFFE41E31)),
// // //         domainFn: (LinearSales sales, _) => sales.year,
// // //         measureFn: (LinearSales sales, _) => sales.sales,
// // //         dashPatternFn: (_, __) => [8, 2, 4, 2],
// // //         data: data1,
// // //       ),
// // //       charts.Series<LinearSales, int>(
// // //         id: 'User',
// // //         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF13A331)),
// // //         domainFn: (LinearSales sales, _) => sales.year,
// // //         measureFn: (LinearSales sales, _) => sales.sales,
// // //         // dashPatternFn: (_, __) => [8, 2, 4, 2],
// // //         data: data2,
// // //       ),
// // //       charts.Series<LinearSales, int>(
// // //         id: 'Dart',
// // //         colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF6300A1)),
// // //         domainFn: (LinearSales sales, _) => sales.year,
// // //         measureFn: (LinearSales sales, _) => sales.sales,
// // //         // dashPatternFn: (_, __) => [8, 2, 4, 2],
// // //         data: data3,
// // //       )
// // //     ];
// // //
// // //     return charts.LineChart(seriesList,
// // //         animate: true,
// // //         defaultRenderer: charts.LineRendererConfig(
// // //           // 圆点大小
// // //           radiusPx: 5.0,
// // //           stacked: false,
// // //           // 线的宽度
// // //           strokeWidthPx: 2.0,
// // //           // 是否显示线
// // //           includeLine: true,
// // //           // 是否显示圆点
// // //           includePoints: true,
// // //           // 是否显示包含区域
// // //           includeArea: true,
// // //           // 区域颜色透明度 0.0-1.0
// // //           areaOpacity: 0.2,
// // //         ));
// // //   }
// // // }
// // //
// // // class LinearSales {
// // //   final int year;
// // //   final int sales;
// // //
// // //   LinearSales(this.year, this.sales);
// // // }
// // import 'dart:math';
// //
// // import 'package:charts_flutter/flutter.dart' as charts;
// // import 'package:flutter/material.dart';
// //
// // class ChartTestPage extends StatelessWidget {
// //   const ChartTestPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("chart_flutter")),
// //       body: Column(children: [Container(height: 240, child: _simpleBar())]),
// //     );
// //   }
// //
// //   Widget _simpleBar() {
// //     var random = Random();
// //
// //     var data = [
// //       OrdinalSales('2014', 10),
// //       OrdinalSales('2015', random.nextInt(100)),
// //       OrdinalSales('2016', random.nextInt(100)),
// //       OrdinalSales('2017', random.nextInt(100)),
// //     ];
// //     var data1 = [
// //       OrdinalSales('2014', 10),
// //       OrdinalSales('2015', random.nextInt(100)),
// //       OrdinalSales('2016', random.nextInt(100)),
// //       OrdinalSales('2017', random.nextInt(100)),
// //     ];
// //     var data2 = [
// //       OrdinalSales('2014', 10),
// //       OrdinalSales('2015', random.nextInt(100)),
// //       OrdinalSales('2016', random.nextInt(100)),
// //       OrdinalSales('2017', random.nextInt(100)),
// //     ];
// //
// //     // var seriesList = [
// //     //   charts.Series<OrdinalSales, String>(
// //     //     id: 'Sales',
// //     //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
// //     //     domainFn: (OrdinalSales sales, _) => sales.year,
// //     //     measureFn: (OrdinalSales sales, _) => sales.sales,
// //     //     data: data,
// //     //   )
// //     // ];
// //     var seriesList = [
// //       charts.Series<OrdinalSales, String>(
// //         id: 'Sales',
// //         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
// //         domainFn: (OrdinalSales sales, _) => sales.year,
// //         measureFn: (OrdinalSales sales, _) => sales.sales,
// //         data: data1,
// //       ),
// //       charts.Series<OrdinalSales, String>(
// //         id: 'Sales',
// //         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
// //         domainFn: (OrdinalSales sales, _) => sales.year,
// //         measureFn: (OrdinalSales sales, _) => sales.sales,
// //         data: data2,
// //       )
// //     ];
// //
// //     return charts.BarChart(
// //       seriesList,
// //       animate: true,
// //     );
// //   }
// // }
// //
// // class OrdinalSales {
// //   final String year;
// //   final int sales;
// //
// //   OrdinalSales(this.year, this.sales);
// // }
//搜索测试
// // import 'package:flutter/material.dart';
// //
// // const searchList = ['jiejie-大长腿', 'jiejie-水蛇腰', 'gege-帅气欧巴', 'gege-小鲜肉'];
// //
// // const recentSuggest = [
// //   '推荐-1',
// //   '推荐-2',
// // ];
// //
// // class SearchBarDemo extends StatefulWidget {
// //   _SearchBarDemoState createState() => _SearchBarDemoState();
// // }
// //
// // class _SearchBarDemoState extends State<SearchBarDemo> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('SearchBarDemo'),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(Icons.search),
// //             onPressed: () {
// //               showSearch(context: context, delegate: SearchBarDelegate());
// //             },
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class SearchBarDelegate extends SearchDelegate<String> {
// //   //清空按钮
// //   @override
// //   List<Widget> buildActions(BuildContext context) {
// //     return [
// //       IconButton(
// //         icon: Icon(Icons.clear),
// //         onPressed: () => query = "", //搜索值为空
// //       )
// //     ];
// //   }
// //
// //   //返回上级按钮
// //   @override
// //   Widget buildLeading(BuildContext context) {
// //     return IconButton(
// //         icon: AnimatedIcon(
// //             icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
// //         onPressed: () => close(context, '') //点击时关闭整个搜索页面
// //         );
// //   }
// //
// //   //搜到到内容后的展现
// //   @override
// //   Widget buildResults(BuildContext context) {
// //     return Container(
// //       width: 100.0,
// //       height: 100.0,
// //       child: Card(
// //         color: Colors.redAccent,
// //         child: Center(
// //           child: Text(query),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   //设置推荐
// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     final suggestionsList = query.isEmpty
// //         ? recentSuggest
// //         : searchList.where((input) => input.startsWith(query)).toList();
// //
// //     return ListView.builder(
// //       itemCount: suggestionsList.length,
// //       itemBuilder: (context, index) => ListTile(
// //         title: RichText(
// //           //富文本
// //           text: TextSpan(
// //               text: suggestionsList[index].substring(0, query.length),
// //               style:
// //                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// //               children: [
// //                 TextSpan(
// //                     text: suggestionsList[index].substring(query.length),
// //                     style: TextStyle(color: Colors.grey))
// //               ]),
// //         ),
// //       ),
// //     );
// //   }
// // }
//表格翻页测试
import 'package:flutter/material.dart';
import 'package:proflu/common/api/gql_sourse.dart';
import 'package:proflu/common/entitys/soursedata_infor.dart';
import 'package:proflu/pages/home/test.dart';

var nameList = ["绿皮南瓜", "番茄", "白菜", "胡萝卜", "土豆", "甜菜", "白甜"];
late bool flag; //判断搜索框内输入的内容是否存在于数据列表里

const recentSuggest = [
  '推荐-1',
  '推荐-2',
];

//定义model类
class User {
  User(this.name, this.age, this.sex, {this.selected = false});

  final String name;
  final int age;
  final String sex;
  bool selected;
}

List<User> _data = [];

class FanYe extends StatefulWidget {
  const FanYe({Key? key}) : super(key: key);

  @override
  _FanYeState createState() => _FanYeState();
}

class _FanYeState extends State<FanYe> {
  late Inforponse _postsIfoData;
  List _focusData = [];
  //生成数据
  @override
  void initState() {
    List.generate(100, (index) {
      _data.add(User('老孟$index', index % 50, index % 2 == 0 ? '男' : '女'));
    });
    super.initState();
    _loadIfoData();
  }

  // 读取所有数据
  _loadIfoData() async {
    _postsIfoData = await SourseAPI.userup(context: context, schema: '');
    var focusList = _postsIfoData.latestInformation;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  var _rowsPerPage = 5;
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // _buildPaginatedDataTable()
        PaginatedDataTable(
          sortColumnIndex: 2,
          sortAscending: _sortAscending,
          onPageChanged: (page) {
            print('onPageChanged:$page');
          },
          // onRowsPerPageChanged: (v) {
          //   setState(() {
          //     _rowsPerPage = v!;
          //   });
          // },
          availableRowsPerPage: [5, 10, 15, 16],
          onRowsPerPageChanged: (v) => setState(() => _rowsPerPage = v!),
          rowsPerPage: _rowsPerPage,
          header: Text('header'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
          columns: [
            DataColumn(label: Text('姓名')),
            DataColumn(label: Text('性别')),
            DataColumn(
                label: Text('年龄'),
                onSort: (index, sortAscending) {
                  setState(() {
                    _sortAscending = sortAscending;
                    if (sortAscending) {
                      _data.sort((a, b) => a.age.compareTo(b.age));
                    } else {
                      _data.sort((a, b) => b.age.compareTo(a.age));
                    }
                  });
                }),
          ],
          source: MyDataTableSource(_data),
        )
      ],
    );
  }

  var _sortAscending = true;

  _buildPaginatedDataTable() {
    return PaginatedDataTable(
      header: Text('header'),
      sortColumnIndex: 2,
      sortAscending: _sortAscending,
      columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(label: Text('性别')),
        DataColumn(
            label: Text('年龄'),
            onSort: (index, sortAscending) {
              setState(() {
                _sortAscending = sortAscending;
                if (sortAscending) {
                  _data.sort((a, b) => a.age.compareTo(b.age));
                } else {
                  _data.sort((a, b) => b.age.compareTo(a.age));
                }
              });
            }),
      ],
      source: MyDataTableSource(_data),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data);

  final List<User> data;

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      selected: data[index].selected,
      onSelectChanged: (selected) {
        if (selected != null) {
          data[index].selected = selected;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text('${data[index].name}'), showEditIcon: true, onTap: () {
          NiHao();
        }, placeholder: true),
        DataCell(Text('${data[index].sex}')),
        DataCell(Text('${data[index].age}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 16),
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              color: Color.fromRGBO(230, 230, 230, 1.0),
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Row(
              children: const <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.search, color: Colors.teal)),
                Text(
                  "点我进行搜索",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            onTap: () {
              //这里是跳转搜索界面的关键
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ),
      )),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  //返回值为我们搜索框右侧的一个控件
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        }, //搜索值为空
      )
    ];
  }

  //返回值为我们搜索框左侧的一个控件
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, 'null') //点击时关闭整个搜索页面
        );
  }

  //返回值为我们搜到内容后的展现
  @override
  Widget buildResults(BuildContext context) {
    for (int i = 0; i < nameList.length; i++) {
      if (query == nameList[i]) {
        flag = true;
        break;
      } else {
        flag = false;
      }
    }

    return flag == true
        ? Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              child: Text(query),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new TextScreen(s: query),
                    //TextScreen()用于展示我们想要通过搜索到达的页面，
                    //这里用到了构造函数传值。
                  ),
                );
              },
            ))
        : Center(
            child: Text("没有找到这个蔬菜！！！"),
          );
  }

  //设置推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentSuggest
        : nameList.where((input) => input.startsWith(query)).toList();
//判断集合中的字符串是否以搜索框内输入的字符串开头，
//是则返回true，并将筛选出来的结果以list的方式储存在searchList里
    return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: RichText(
                //富文本
                text: TextSpan(
                    text: suggestionsList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionsList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) =>
                      new TextScreen(s: suggestionsList[index]),
                ),
              );
            },
          );
        });
  }

  //返回一个主题，也就是可以自定义搜索界面的主题样式
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context);
  }
}

class TextScreen extends StatelessWidget {
  final String s;
  TextScreen({Key? key, required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: AppBar(
        title: Text("搜索结果内容"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(s),
          )),
    );
  }
}
