import 'package:flutter/material.dart';
import 'package:proflu/pages/start/loading.dart';

import '../../pages/app.dart';
import '../../pages/other/customer.dart';
import '../../pages/other/download.dart';
import '../../pages/other/history.dart';
import '../../pages/other/message.dart';
import '../../pages/search.dart';
import '../../pages/sign_in/login.dart';
import '../../pages/start/first_guide.dart';
//import '../pages/users/settings/settings.dart';
//import '../pages/course/course_index.dart';

//配置路由
final Map<String, Function> routes = {
  '/': (context) => const LoadingPage(),
  '/firstguide': (context) => const FirstGuidePage(),
  '/app': (context) => const App(),
  '/search': (context) => const SearchPage(),
  '/history': (context) => const History(),
  '/download': (context) => const Download(),
  '/customer': (context) => const Customer(),
  '/message': (context) => const Message(),
  //'/course': (context) => CourseIndexPage(),
  '/login': (context) => const Login1(),
  //'/set': (context) => SettingsPage(),
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
