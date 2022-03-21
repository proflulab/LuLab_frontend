import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/common/api/gql_user.dart';
import 'package:proflu/common/entitys/userdata_login.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/utils/storage.dart';
import 'package:proflu/pages/voice/voice_view.dart';

import '../common/values/values.dart';
import 'course/course_page.dart';
import 'home/home_page.dart';
import 'source/Information_page.dart';
import 'users/users_page.dart';

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
    const VoiceView(),
    const InformationPage(),
    const UsersPage(),
  ];

  @override
  void initState() {
    super.initState();
    _handleSignIn();
  }

  // 执行登录操作
  _handleSignIn() async {
    var user = Storage.getJson(storageUserProfileKey);
    user.then((guide) async {
      if (kDebugMode) {
        print(guide);
      }
      var user1 = UserLogin.fromJson(json.decode(guide!));
      print(user1.data.name);
      Loginrequest variables = Loginrequest(
        name: user1.data.name,
        password: user1.data.password,
      );
      try {
        UserLogin userProfile = await GqlUserAPI.login(
          context: context,
          variables: variables,
        );
        Global.saveProfile(userProfile);
      } catch (e) {
        if (kDebugMode) {
          print("===========登录报错内容===============");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 语音识别按钮
        floatingActionButton: const VoiceView(),
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
            // 选中图标主题
            selectedIconTheme: const IconThemeData(
              // 图标颜色
              color: Color.fromRGBO(77, 196, 96, 1),
              // 图标大小
              size: 28,
              // 图标透明度
              opacity: 1.0,
            ),
            //选中字体颜色
            selectedLabelStyle: const TextStyle(
              fontFamily: 'MyFontStyle',
              color: Color.fromRGBO(77, 196, 96, 1),
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
