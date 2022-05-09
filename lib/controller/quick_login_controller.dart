import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/events/quick_login_event.dart';
import 'package:quickpass_yidun_flutter/quickpass_flutter_plugin.dart';

class QuickLoginController extends GetxController {
  /// 统一 key
  final String fResultKey = "success";

  QuickpassFlutterPlugin quickLoginPlugin = QuickpassFlutterPlugin();

  bool _verifyEnable = false;

  bool get verifyEnable => _verifyEnable;

  var eventChannel = const EventChannel("yd_quicklogin_flutter_event_channel");

  String? ydToken;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      checkVerifyEnable();
    });
    eventChannel.receiveBroadcastStream().listen(_onData, onError: _onError);
    _initQuickLogin();
  }

  Future<void> _initQuickLogin() async {
    await quickLoginPlugin.init("9afb4225b463415cb915f4660949c181", 4);
  }

  checkVerifyEnable() {
    quickLoginPlugin.checkVerifyEnable().then((map) {
      bool result = map![fResultKey];
      if (result) {
        debugPrint("当前网络环境【支持认证】！");
        _verifyEnable = true;
        update();
        preLogin();
      } else {
        debugPrint("当前网络环境【不支持认证】！");
      }
    });
  }

  // 登录预取号
  void preLogin() async {
    Map? map = await quickLoginPlugin.preFetchNumber();
    if (map?['success'] == true) {
      var ydToken = map?['token'];
      debugPrint("===预取号成功===");
      debugPrint(ydToken);
      this.ydToken = ydToken;
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
        if (kDebugMode) {
          print("取号成功, 运营商授权码:" + accessToken);
        }
        quickLoginPlugin.closeLoginAuthView();
        Global.eventBus.fire(QuickLoginEvent(accessToken));
      } else {
        var errorMsg = map?["msg"];
        if (kDebugMode) {
          print("取号失败, 出错原因:" + errorMsg);
        }
        quickLoginPlugin.closeLoginAuthView();
      }
    });
  }

  void _onData(response) {
    if (response is Map) {
      var action = (response)["action"];
      if (action == "handleCustomEvent") {
        quickLoginPlugin.closeLoginAuthView();
      }
    }
  }

  _onError(Object error) {
    if (kDebugMode) {
      print("error");
    }
    if (kDebugMode) {
      print(error);
    }
  }
}
