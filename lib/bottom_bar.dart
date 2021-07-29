import 'package:flutter/material.dart';
import 'child_item_view.dart';

///有状态StatefulWidget
///继承于 StatefulWidget，通过 State 的 build 方法去构建控件

class BotomeMenumBarPage extends StatefulWidget {
////通过构造方法传值
  BotomeMenumBarPage();
//主要是负责创建state
  @override
  BotomeMenumBarPageState createState() => BotomeMenumBarPageState();
}

///在 State 中,可以动态改变数据
///在 setState 之后，改变的数据会触发 Widget 重新构建刷新
class BotomeMenumBarPageState extends State<BotomeMenumBarPage> {
  BotomeMenumBarPageState();
  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//构建页面
    return buildBottomTabScaffold();
  }

//当前显示页面的
  int currentIndex = 0;
//点击导航项是要显示的页面
  final pages = [
    ChildItemView("首页"),
    ChildItemView("课程"),
    ChildItemView("咨询"),
    ChildItemView("我的")
  ];
  Widget buildBottomTabScaffold() {
    return SizedBox(
        height: 100,
        child: Scaffold(
//对应的页面
          body: pages[currentIndex],
//appBar: AppBar(title: const Text('Bottom App Bar')),
//悬浮按钮的位置
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
//悬浮按钮
          floatingActionButton: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(60)),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.graphic_eq,
                color: Colors.blue,
              ),
              onPressed: () {
                print("add press ");
              },
            ),
          ),
//其他菜单栏
          bottomNavigationBar: BottomAppBar(
//悬浮按钮 与其他菜单栏的结合方式
            shape: CircularNotchedRectangle(),
// FloatingActionButton和BottomAppBar 之间的差距
            notchMargin: 6.0,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBotomItem(currentIndex, 0, Icons.home, "首页"),
                buildBotomItem(currentIndex, 1, Icons.class__outlined, "课程"),
                buildBotomItem(currentIndex, -1, Icons.access_alarm, ""),
                buildBotomItem(currentIndex, 2, Icons.sms, "咨询"),
                buildBotomItem(currentIndex, 3, Icons.account_circle, "我的"),
              ],
            ),
          ),
        ));
  }

// ignore: slash_for_doc_comments
/**
* @param selectIndex 当前选中的页面
* @param index 每个条目对应的角标
* @param iconData 每个条目对就的图标
* @param title 每个条目对应的标题
*/
  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
//未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
    // MaterialColor iconColor = Colors.grey;
    Color iconColor = Colors.grey;
    double iconSize = 20;
    EdgeInsetsGeometry padding = EdgeInsets.only(top: 8.0);
    if (selectIndex == index) {
//选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0, color: Colors.black);
//选中状态的按钮样式
      iconColor = Colors.black;
      iconSize = 25;
      padding = EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    padItem = Padding(
      padding: padding,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: iconColor,
                size: iconSize,
              ),
              Text(
                title,
                style: textStyle,
              )
            ],
          ),
        ),
      ),
    );
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}
