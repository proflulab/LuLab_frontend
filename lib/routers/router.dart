import 'package:flutter/material.dart';
import '../../app.dart';
import '../pages/loading.dart';
import '../../pages/search.dart';
import '../../pages/other/customer.dart';
import '../../pages/other/download.dart';
import '../../pages/other/history.dart';
import '../../pages/other/message.dart';
import '../../pages/first_guide.dart';
import '../pages/course/course_index.dart';

//配置路由
final Map<String, Function> routes = {
  '/': (context) => LoadingPage(),
  '/firstguide': (context) => FirstGuidePage(),
  '/app': (context) => App(),
  '/search': (context) => SearchPage(),
  '/history': (context) => History(),
  '/download': (context) => Download(),
  '/customer': (context) => Customer(),
  '/message': (context) => Message(),
  '/course': (context) => CourseIndexPage(),
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
