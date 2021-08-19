import 'package:flutter/material.dart';
import 'package:lulab/app.dart';
import 'loading.dart';

/*
启动页面

*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LuLab",
      //theme: ThemeData.light(),
      theme: mDefaultTheme,
      home: LoadingPage(),
      routes: <String, WidgetBuilder>{'/App': (context) => App()},
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  //主⾊，决定导航栏颜⾊
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f),
);
