import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'pages/home/home_page.dart';
import 'pages/course/course_page.dart';
import 'pages/users/users_page.dart';
import 'pages/source/Information_page.dart';
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
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final List _pageList = [
    const HomePage(),
    const CoursePage(),
    const VoicePage(),
    const InformationPage(),
    const UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //语音识别按钮
        floatingActionButton: AvatarGlow(
          animate: true,
          glowColor: Colors.red,
          endRadius: 65.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: Container(
              height: 80.0,
              width: 80.0,
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: const Color.fromRGBO(250, 250, 250, 1),
              ),
              child: InkWell(
                onTap: () {
                  executar(
                      'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3');
                  if (kDebugMode) {
                    print("点击事件");
                  }
                },
                onDoubleTap: () {
                  pausar();
                  if (kDebugMode) {
                    print("双击事件");
                  }
                },
                onTapCancel: () {
                  if (kDebugMode) {
                    print("点击取消");
                  }
                },
                onLongPress: () {
                  if (kDebugMode) {
                    print("长按事件");
                  }
                },
                child: const Icon(Icons.graphic_eq),

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
        body: _pageList[_currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            // 去掉水波纹效果
            splashColor: Colors.transparent,
            // 去掉长按效果
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
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
            selectedIconTheme: const IconThemeData(
              // 图标颜色
              color: Colors.blue,
              // 图标大小
              size: 28,
              // 图标透明度
              opacity: 1.0,
            ),
            //未选中图标主题
            unselectedIconTheme: const IconThemeData(
              color: Colors.black,
              size: 26,
              opacity: 1,
            ),

            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconHomeDefault),
                  activeIcon: Icon(MyIcon.navIconHomeSelected),
                  label: ('首页'),
                  //去掉长按提示语
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconCourseDefault),
                  activeIcon: Icon(MyIcon.navIconCourseSelected),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconFindDefault),
                  activeIcon: Icon(MyIcon.navIconFindSelected),
                  label: ('资讯'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconUserDefault),
                  activeIcon: Icon(MyIcon.navIconUserSelected),
                  label: ('我的'),
                  tooltip: '')
            ],
          ),
        ));
  }
}
