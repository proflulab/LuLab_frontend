import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'course/course_page.dart';
import 'users/users_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  //late DateTime _lastPressedAt; //上次点击时间

  final List<Widget> _pageList = [
    const CoursePage(),
    const UsersPage(),
  ];

  @override
  void initState() {
    super.initState();
    _handleSignIn();
    NetState.network();
  }

  // 执行登录操作
  _handleSignIn() async {
    var user = Storage.getJson(storageUserProfileKey);
    user.then(
      (guide) async {
        var user1 = Data.fromJson(json.decode(guide!));
        if (kDebugMode) {
          print(user1.name);
        }
        try {
          UserLogin userProfile = await GqlUserAPI.login(
            context: context,
            variables: Loginrequest(
              name: user1.name ?? "",
              password: user1.password ?? "",
            ),
          );
          Global.saveProfile(userProfile.data!);
        } catch (e) {
          if (kDebugMode) {
            print("===========登录报错内容===============");
            print(e);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UseWillPopScope(
      child: Stack(
        children: [
          Positioned.fill(
            child: Scaffold(
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _pageList,
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  // 去掉水波纹效果
                  splashColor: Colors.transparent,
                  // 去掉长按效果
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  currentIndex: _currentIndex,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    _pageController.jumpToPage(index);
                  },
                  // 选中图标主题
                  selectedIconTheme: const IconThemeData(
                    color: PFc.themeColor,
                    size: 28,
                    opacity: 1.0,
                  ),
                  //选中字体颜色
                  selectedLabelStyle: const TextStyle(color: PFc.themeColor),
                  selectedItemColor: PFc.themeColor,
                  //未选中图标主题
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.black,
                    size: 26,
                    opacity: 1,
                  ),
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(PFIcon.navIconHomeDefault),
                        activeIcon: Icon(PFIcon.navIconHomeSelected),
                        label: ('首页'),
                        tooltip: ''),
                    BottomNavigationBarItem(
                        icon: Icon(PFIcon.navIconUserDefault),
                        activeIcon: Icon(PFIcon.navIconUserSelected),
                        label: ('我的'),
                        tooltip: '')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
