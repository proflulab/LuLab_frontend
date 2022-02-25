import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '',
      expandedValue: '课程名称',
    );
  });
}

class ExpansionPanelPage extends StatefulWidget {
  const ExpansionPanelPage({Key? key}) : super(key: key);

  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  final List<Item> _data = generateItems(1);
  var isExpanded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ExpansionPanelPage'),
      // ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            // 简介
            _buildPanel(),
            // 收藏、缓存、分享
            // buildFavDownShare(),
            // 目录
            // buildCatalog(),
          ],
        ),
        // ]),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      // expansionCallback: (index, isExpanded) {
      //   setState(() {
      //     if (this.isExpanded == isExpanded) {
      //       this.isExpanded = !this.isExpanded;
      //     }
      //   });
      // },

      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (index, opened) {
            return const ListTile(
              title: Text("更多内容"),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              height: 500.0,
              color: Colors.white,
              alignment: Alignment.center,
              child: const Icon(
                Icons.security,
                size: 35.0,
              ),
              // const CourseDetail(),
            ),
          ),
          isExpanded: item.isExpanded,
        );
        // return ExpansionPanel(
        //   headerBuilder: (BuildContext context, bool isExpanded) {
        //     return Container(
        //       color: Colors.white,
        //       width: 330.0, //容器的相关参数
        //       height: 30.0,
        //
        //       alignment: Alignment.center, //在容器的位置
        //       child: new Text(
        //         '简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介',
        //         style: TextStyle(fontSize: 12.0),
        //       ), //容器内的文字，大小，颜色等参数
        //     );
        //   },
        //   body: CourseDetail(),
        //   isExpanded: item.isExpanded,
        // );
      }).toList(),
    );
  }
}

Row buildFavDownShare() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [
      Icon(
        Icons.star,
        size: 22,
        color: Colors.grey,
      ),
      Icon(
        Icons.download,
        size: 22,
        color: Colors.grey,
      ),
      Icon(
        Icons.share,
        size: 22,
        color: Colors.grey,
      ),
    ],
  );
}

// 目录
Column buildCatalog() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            '目录',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('第${index + 1}节：大公司被颠覆的底层原因\n25分钟'),
            ),
          )),
    ],
  );
}

// return ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return Container(
// width: 500.0, //容器的相关参数
// height: 400.0,
// color: Colors.lightBlue,
// alignment: Alignment.center, //在容器的位置
// child: new Text(
// 'Hello JSPang',
// style: TextStyle(fontSize: 40.0),
// ), //容器内的文字，大小，颜色等参数
// );
// },
// body: Container(
// width: 500.0, //容器的相关参数
// height: 400.0,
// color: Colors.lightBlue,
// alignment: Alignment.center, //在容器的位置
// child: new Text(
// 'Hello JSPang',
// style: TextStyle(fontSize: 40.0),
// ), //容器内的文字，大小，颜色等参数
// ),
// isExpanded: item.isExpanded,
// );
