import 'package:flutter/material.dart';
import 'package:lulab/services/myIcon.dart';
import 'pages/home/homePage.dart';
import 'pages/learn/learnPage.dart';
import 'pages/users/UsersPage.dart';
import 'pages/voicePage.dart';
import 'pages/informationPage.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  List _pageList = [
    HomePage(),
    LearnPage(),
    VoicePage(),
    InformationPage(),
    UsersPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //语音识别按钮
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            // selectedFontSize: 12,
            // unselectedFontSize: 12,
            // selectedItemColor: Colors.black,
            // 未选中颜色
            //unselectedItemColor: Color.fromRGBO(117, 117, 117, 1),
            // 选中图标主题
            selectedIconTheme: IconThemeData(
              // 图标颜色
              color: Colors.blue,
              // 图标大小
              size: 28,
              // 图标透明度
              opacity: 1.0,
            ),
            //未选中图标主题
            unselectedIconTheme: IconThemeData(
              color: Color.fromRGBO(117, 117, 117, 1),
              size: 24,
              opacity: 0.6,
            ),

            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_home_default),
                  activeIcon: Icon(MyIcon.nav_icon_home_selected),
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
                  icon: Icon(Icons.account_circle), label: ('我的'), tooltip: '')
            ],
          ),
        ));
  }
}
