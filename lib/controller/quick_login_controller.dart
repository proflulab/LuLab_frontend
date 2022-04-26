import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickpass_yidun_flutter/quickpass_flutter_plugin.dart';

class QuickLoginController extends GetxController {
  /// 统一 key
  final String f_result_key = "success";

  QuickpassFlutterPlugin quickLoginPlugin = QuickpassFlutterPlugin();

  bool _verifyEnable = false;

  bool get verifyEnable => _verifyEnable;

  @override
  void onInit() {
    super.onInit();
    _initQuickLogin();
  }

  _initQuickLogin() {
    quickLoginPlugin.init("9afb4225b463415cb915f4660949c181").then((value) {
      debugPrint("==一键登录初始化成功=");
      quickLoginPlugin.checkVerifyEnable().then((map) {
        bool result = map![f_result_key];
        if (result) {
          debugPrint("当前网络环境【支持认证】！");
          _verifyEnable = true;
          update();
          preLogin();
        } else {
          debugPrint("当前网络环境【不支持认证】！");
        }
      });
    }).catchError((e) {
      print(e);
    });
  }

  // 登录预取号
  void preLogin() async {
    Map? map = await quickLoginPlugin.preFetchNumber();
    if (map?['success'] == true) {
      var ydToken = map?['token'];
      debugPrint("===预取号成功===");
      debugPrint(ydToken);
    } else {
      var errorMsg = map?['errorMsg'];
      debugPrint("===预取号失败===");
      debugPrint(errorMsg);
    }
  }

  void quickLogin() {
    String file = "";
    if (Platform.isIOS) {
      file = "assets/quick_login/ios-config.json";
    } else if (Platform.isAndroid) {
      file = "assets/quick_login/android-config.json";
    }
    rootBundle.loadString(file).then((value) async {
      var configMap = {"uiConfig": json.decode(value)};
      quickLoginPlugin.setUiConfig(configMap);
      Map? map = await quickLoginPlugin.onePassLogin();
      if (map?["success"] == true) {
        var accessToken = map?["accessToken"];
        print("取号成功, 运营商授权码:" + accessToken);
        quickLoginPlugin.closeLoginAuthView();
      } else {
        var errorMsg = map?["msg"];
        print("取号失败, 出错原因:" + errorMsg);
        quickLoginPlugin.closeLoginAuthView();
      }
    });
  }
}
