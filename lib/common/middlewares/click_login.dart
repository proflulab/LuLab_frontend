import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:get/get.dart';

import '../../controller/quick_login_controller.dart';

import '../../pages/app.dart';
import '../api/apis.dart';
import '../entitys/entitys.dart';
import '../global/global.dart';
import '../routers/app_pages.dart';
import '../widget/widgets.dart';

import '../../common/global/global.dart';

import '../../events/quick_login_event.dart';

class ClickLoginMiddleware extends GetMiddleware {
  QuickLoginController qc = Get.put(QuickLoginController());

  @override
  int? priority = 0;

  StreamSubscription? _subscription;

  ClickLoginMiddleware({required this.priority});

  get context => null;

  @override
  RouteSettings? redirect(String? route) {
    debugPrint("一键登录中间件------------------------------");

    if (qc.verifyEnable) {
      _subscription = Global.eventBus.on<QuickLoginEvent>().listen((event) {
        _quickLogin(event.token);
        debugPrint(event.token);
      });
      qc.quickLogin();
    }

    // if (Global.token == "0") {
    //   debugPrint("游客登陆");
    //   Global.state = UserState.visitor;
    //   return const RouteSettings(name: AppRoutes.app);
    // } else if (Global.token != "0") {
    //   debugPrint("10");
    //   Global.state = UserState.user;
    //   return const RouteSettings(name: AppRoutes.app);
    // }
    return null;
  }

  /// 在这里请求服务器
  _quickLogin(String token) async {
    Clipboard.setData(ClipboardData(text: "$token,${qc.ydToken}"));
    debugPrint("----------------------------------------------------");
    debugPrint("$token,${qc.ydToken}");

    QuickLoginReq variables = QuickLoginReq(
      token: qc.ydToken ?? "",
      accessToken: token,
    );
    try {
      QuickLoginRes status =
          await DioUserAPI.quickLogin(context: context, data: variables);
      Global.saveToken(status.token ?? "无");
    } catch (e) {
      debugPrint("===========登录报错内容===============");
      debugPrint(e.toString());
      toastInfo(msg: '一键登录失败,请尝试其他登录方式');
      return const RouteSettings(name: AppRoutes.load);
    }
  }
}
