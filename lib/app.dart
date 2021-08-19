import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/coursePage.dart';
import 'pages/personPage.dart';
import 'pages/voicePage.dart';
import 'pages/informationPage.dart';
// import 'appbar_page/AppBar_course.dart';
// import 'appbar_page/AppBar_home.dart';
// import 'appbar_page/AppBar_information.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  // List _appbarList = [
  //   AppBarcourse(),
  //  AppBarhome(),
  //   AppBarinformation(),
  // ];
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
                //设置appBar高度
                preferredSize: Size.fromHeight(90),
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
                      //文字选中颜色
                      labelColor: Colors.black,
                      //文字未选中颜色
                      unselectedLabelColor: Color.fromRGBO(89, 89, 89, 1),
                      //文字选中样式
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      //文字未选中样式
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                      //设置线条的颜色
                      indicatorColor: Color(0xFF0D6AF5),
                      //设置线条的粗细
                      indicatorWeight: 3,
                      indicatorPadding:
                          EdgeInsets.only(right: 40, left: 40, bottom: 3)),
                  title: InkWell(
                    //onTap是点击事件回调
                    //onTap: () {},
                    child: Container(
                      height: 30.0,
                      padding: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          //改变搜索外框颜色
                          //border: Border.all(color: Colors.black),
                          color: Color.fromRGBO(230, 230, 230, 0.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(children: <Widget>[
                        Icon(
                          Icons.search,
                          color: (Color.fromRGBO(89, 89, 89, 1)),
                        ),
                        Text(
                          "   开始搜索",
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(89, 89, 89, 1),
                            fontSize: 15,
                          ),
                        )
                      ]),
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.headset_mic,
                        color: Color.fromRGBO(117, 117, 117, 1)),
                    //如果没有onPressed会报错
                    onPressed: () {
                      print("跳转到客服");
                    },
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
                )),
            floatingActionButton: Container(
              height: 80.0,
              width: 80.0,
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color.fromRGBO(250, 250, 250, 1),
              ),
              child: FloatingActionButton(
                  child: Icon(Icons.graphic_eq),
                  onPressed: () {
                    print("弹起语音识别");
                  },
                  backgroundColor: Color.fromRGBO(34, 139, 230, 0.8)),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: this._pageList[this._currentIndex],
            bottomNavigationBar: Theme(
              data: ThemeData(
                // 去掉水波纹效果
                splashColor: Colors.transparent,
                // 去掉长按效果
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: this._currentIndex,
                onTap: (int index) {
                  setState(() {
                    this._currentIndex = index;
                  });
                },
                //icon的大小
                //iconSize: 36.0,
                //选中选项颜色
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
                      icon: Icon(Icons.home),
                      label: ('首页'),
                      //去掉长按提示语
                      tooltip: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.class__outlined),
                      label: ('课程'),
                      tooltip: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.access_alarm), label: (''), tooltip: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sms), label: ('资讯'), tooltip: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: ('我的'),
                      tooltip: '')
                ],
              ),
            )));
  }
}
