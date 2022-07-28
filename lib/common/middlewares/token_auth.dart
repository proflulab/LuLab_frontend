import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/common/global/global.dart';

import '../routers/app_pages.dart';

class TokenMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  TokenMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    debugPrint("------------------------------");
    debugPrint("校验token");
    if (Global.token == "0") {
      print("游客登陆");
    } else if (Global.token == "1") {
      print("10");
    } else if (Global.token == "2") {
      print("20");
    }

    return const RouteSettings(name: AppRoutes.app);
  }
}
