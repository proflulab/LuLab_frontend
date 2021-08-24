import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routers/router.dart';

/*
启动页面
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334), //配置设计稿的宽度高度
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "陆向谦Lab",
            theme: mDefaultTheme,
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute));
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
