import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'pages/home/home_page.dart';
import 'pages/course/course_page.dart';
import 'pages/users/users_page.dart';
import 'pages/source/Informationpage.dart';
import 'pages/voice/voicepage.dart';

import 'widget/widgets.dart';
import '/values/values.dart';

// import 'package:flutter_sound_lite/flutter_sound.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
// import 'package:flutter_sound_lite/public/tau.dart';
// import 'package:flutter_sound_lite/public/ui/recorder_playback_controller.dart';
// import 'package:flutter_sound_lite/public/ui/sound_player_ui.dart';
// import 'package:flutter_sound_lite/public/ui/sound_recorder_ui.dart';
// import 'package:flutter_sound_lite/public/util/enum_helper.dart';
// import 'package:flutter_sound_lite/public/util/flutter_sound_ffmpeg.dart';
// import 'package:flutter_sound_lite/public/util/flutter_sound_helper.dart';
// import 'package:flutter_sound_lite/public/util/temp_file_system.dart';
// import 'package:flutter_sound_lite/public/util/wave_header.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  List _pageList = [
    HomePage(),
    CoursePage(),
    VoicePage(),
    InformationPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //语音识别按钮
        floatingActionButton: AvatarGlow(
          animate: true,
          glowColor: Colors.red,
          endRadius: 65.0,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          child: Container(
              height: 80.0,
              width: 80.0,
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color.fromRGBO(250, 250, 250, 1),
              ),
              child: InkWell(
                onTap: () {
                  executar(
                      'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3');
                  print("点击事件");
                },
                onDoubleTap: () {
                  pausar();
                  print("双击事件");
                },
                onTapCancel: () {
                  print("点击取消");
                },
                onLongPress: () {
                  print("长按事件");
                },
                child: Icon(Icons.graphic_eq),

                // FloatingActionButton(
                //     child: Icon(Icons.graphic_eq),
                //     onPressed: () {
                //       // executar(
                //       //     'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3');
                //       // print("弹起语音识别");
                //     },
                //     backgroundColor: Color.fromRGBO(34, 139, 230, 0.8)),
              )),
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
              color: Colors.black,
              size: 26,
              opacity: 1,
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
                  icon: Icon(MyIcon.nav_icon_course_default),
                  activeIcon: Icon(MyIcon.nav_icon_course_selected),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_find_default),
                  activeIcon: Icon(MyIcon.nav_icon_find_selected),
                  label: ('资讯'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_user_default),
                  activeIcon: Icon(MyIcon.nav_icon_user_selected),
                  label: ('我的'),
                  tooltip: '')
            ],
          ),
        ));
  }
}
