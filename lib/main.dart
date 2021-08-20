import 'package:flutter/material.dart';
import 'package:lulab/pages/other/customer.dart';
import 'package:lulab/pages/other/download.dart';
import 'package:lulab/pages/other/history.dart';
import 'package:lulab/pages/other/message.dart';
import 'app.dart';
import 'loading.dart';
import 'Search.dart';
//import 'routers/router.dart';

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
      //initialRoute: ,
      routes: <String, WidgetBuilder>{
        '/app': (context) => App(),
        '/search': (context) => SearchPage(),
        '/history': (context) => History(),
        '/download': (context) => Download(),
        '/customer': (context) => Customer(),
        '/message': (context) => Message(),
      },
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  //主⾊，决定导航栏颜⾊
  primaryColor: Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xFF3976EE),
);
