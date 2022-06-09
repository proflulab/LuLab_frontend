import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/pages/app.dart';
import 'package:lab/pages/sign_in/sign_in.dart';
import 'package:lab/pages/start/first_guide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../controller/quick_login_controller.dart';
import '../sign_in/login_phone.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  QuickLoginController qc = Get.put(QuickLoginController());
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
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    var _duration = const Duration(seconds: 3);

    if (kDebugMode) {
      print("陆向谦实验室启动....");
    }

    Future<int> result2 = readData2();
    Storage.getBool(storageDeviceAlreadyOpenKey).then(
      (guide) async {
        //判断是否是第一次启动app
        if (guide == true) {
          Future.delayed(_duration, _firstguide);
        } else {
          Future.delayed(_duration, _firstsign);
        }
      },
    );
  }

  void _firstguide() {
    Get.offAll(const FirstGuidePage());
  }

  void _firstsign() {
    Get.offAll(const PhoneLogin());
  }

  void _app() {
    Get.offAll(const App());
  }
}
