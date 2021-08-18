import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'CoursePage.dart';
import 'PersonPage.dart';
import 'VoicePage.dart';
import 'InformationPage.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CoursePage(),
    VoicePage(),
    InformationPage(),
    PersonPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90), //设置appBar高度
            child: AppBar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "推荐区",
                    ),
                    Tab(
                      text: "功勋园",
                    ),
                    Tab(
                      text: "训练营",
                    ),
                  ],
                  labelColor: Colors.black, //文字选中颜色
                  unselectedLabelColor: Color.fromRGBO(89, 89, 89, 1), //文字未选中颜色
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20), //文字选中样式

                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 15), //文字未选中样式
                  indicatorColor: Color(0xFF0D6AF5), //设置线条的颜色
                  indicatorWeight: 3, //设置线条的粗细
                  indicatorPadding:
                      EdgeInsets.only(right: 40, left: 40, bottom: 3)),
              title: InkWell(
                //onTap: () {}, //onTap是点击事件回调
                child: Container(
                  height: 25.0,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black),//改变搜索外框颜色
                      color: Color.fromRGBO(230, 230, 230, 0.8),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.search,
                      color: (Color.fromRGBO(89, 89, 89, 1)),
                    ),
                    Text(
                      "开始搜索",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(89, 89, 89, 1),
                        fontSize: 18,
                      ),
                    )
                  ]),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.headset_mic,
                    color: Color.fromRGBO(117, 117, 117, 1)),
                onPressed: () {
                  print("跳转到客服");
                }, //如果没有onPressed会报错
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      print("我收到的信息");
                    },
                    icon: Icon(
                      Icons.mail,
                      color: Color.fromRGBO(117, 117, 117, 1),
                    ))
              ],
            ),
          ),
          floatingActionButton: Container(
            height: 70.0,
            width: 70.0,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color.fromRGBO(250, 250, 250, 1),
            ),
            child: FloatingActionButton(
                child: Icon(Icons.graphic_eq),
                onPressed: () {
                  print("语音识别");
                },
                backgroundColor: Colors.yellow),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: this._pageList[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: this._currentIndex,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            //iconSize: 36.0, //icon的大小
            //fixedColor: Colors.red,
            //背景颜色
            //backgroundColor: Colors.black,
            //设置文字大小
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Colors.black,
            // 未选中颜色
            unselectedItemColor: Color.fromRGBO(117, 117, 117, 1),
            // 选中图标主题
            selectedIconTheme: IconThemeData(
              // 图标颜色
              color: Colors.black,
              // 图标大小
              size: 30,
              // 图标透明度
              opacity: 1.0,
            ),
            // 未选中图标主题
            unselectedIconTheme: IconThemeData(
              color: Color.fromRGBO(117, 117, 117, 1),
              size: 24,
              opacity: 0.6,
            ),

            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), label: ('首页'), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.class__outlined),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: ('资讯'), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: ('我的'), tooltip: '')
            ],
          ),
        ));
  }
}
