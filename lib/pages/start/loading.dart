import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/entitys/data_login_captcha.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

import '/pages/app.dart';
import '/pages/start/first_guide.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<int> readData2() async {
    var prefs = await SharedPreferences.getInstance();
    var result2 = prefs.getInt('isFirstSign');
    return result2 ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/StartPage.png',
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    debugPrint("陆向谦实验室启动....");
    var _duration = const Duration(seconds: 3);
    Storage.getBool(storageDeviceAlreadyOpenKey).then(
      (value) async {
        // 判断是否是第一次启动app
        // if (value == true || value == null) {
        //   Future.delayed(_duration, _firstguide);
        // } else {
        Future.delayed(_duration, _app);
        // }
      },
    );
  }

  void _firstguide() {
    Get.offAll(const FirstGuidePage());
  }

  void _app() {
    Storage.getString(storaTokenKey).then(
      (value) async {
        // 判断是否是第一次启动app
        if (value == "0" || value == null) {
          debugPrint("游客登陆");
          Global.state = UserState.visitor;
          Global.profile = Data(
              username: "游客",
              profilePicture:
                  'https://tse1-mm.cn.bing.net/th/id/OIP-C.gg1NSgs5KwP71Nh0qlvflQHaFL?w=230&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7');
          Get.offAll(const App());
        } else {
          debugPrint("10");
          Global.state = UserState.user;
          Get.offAll(const App());
        }
      },
    );
  }
}
