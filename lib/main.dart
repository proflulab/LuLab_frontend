import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:lulab/routers/app_pages.dart';
import 'routers/router.dart';
import 'package:get/get.dart';

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
        builder: () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "陆向谦实验室",
            theme: mDefaultTheme,
            initialRoute: '/',
            //getPages: AppPages.routes,
            onGenerateRoute: onGenerateRoute));
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  //主⾊，决定导航栏颜⾊，所有导航栏的颜色将在这里统一设定
  primaryColor: Color.fromRGBO(116, 192, 252, 1),
  //背景主体颜色
  scaffoldBackgroundColor: Color.fromRGBO(246, 246, 246, 1),
  //卡⽚颜⾊
  cardColor: Color(0xF13975EE),
  //次级⾊，决定⼤多数Widget的颜⾊，如进度条、开关等。
  //accentColor: Color(0xFF3976EE),
);
