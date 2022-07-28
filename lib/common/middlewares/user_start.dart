import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../pages/app.dart';
import '../global/global.dart';
import '../routers/app_pages.dart';

import '../utils/utils.dart';
import '../values/values.dart';

class UserStartMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  UserStartMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    debugPrint("------------------------------");
    debugPrint("校验");
    if (Global.token == "0") {
      debugPrint("游客登陆");
      Global.state = UserState.visitor;
      return const RouteSettings(name: AppRoutes.app);
    } else if (Global.token != "0") {
      debugPrint("10");
      Global.state = UserState.user;
      return const RouteSettings(name: AppRoutes.app);
    }
  }
}
