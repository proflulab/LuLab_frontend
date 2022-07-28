import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routers/app_pages.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print("------------------------------");
    Future.delayed(
        const Duration(seconds: 10), () => Get.snackbar("提示", "请先登录APP"));
    return const RouteSettings(name: AppRoutes.app);
  }
}
