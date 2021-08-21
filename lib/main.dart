import 'package:flutter/material.dart';
import 'routers/router.dart';

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
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute

        //home: LoadingPage(),
        //路由管理(放弃该方法/2021.08.21)
        // routes: <String, WidgetBuilder>{
        //   '/app': (context) => App(),
        //   '/search': (context) => SearchPage(),
        //   '/history': (context) => History(),
        //   '/download': (context) => Download(),
        //   '/customer': (context) => Customer(),
        //   '/message': (context) => Message(),
        // },
        );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  //主⾊，决定导航栏颜⾊
  primaryColor: Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  //卡⽚颜⾊
  cardColor: Color(0xFF3976EE),
  //次级⾊，决定⼤多数Widget的颜⾊，如进度条、开关等。
  accentColor: Color(0xFF3976EE),
);
