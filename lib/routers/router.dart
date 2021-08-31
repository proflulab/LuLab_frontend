import 'package:flutter/material.dart';
import 'package:lulab/app.dart';
import '../../pages/loading.dart';
import '../../pages/search.dart';
import 'package:lulab/pages/other/customer.dart';
import 'package:lulab/pages/other/download.dart';
import 'package:lulab/pages/other/history.dart';
import 'package:lulab/pages/other/message.dart';

//配置路由
final Map<String, Function> routes = {
  '/': (context) => LoadingPage(),
  '/app': (context) => App(),
  '/search': (context) => SearchPage(),
  '/history': (context) => History(),
  '/download': (context) => Download(),
  '/customer': (context) => Customer(),
  '/message': (context) => Message(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
