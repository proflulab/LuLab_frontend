import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routers/router.dart';
import '../../values/values.dart';
//BaiduNetdiskDownload 'package:get/get.dart';

//启动页面

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334), //配置设计稿的宽度高度
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "陆向谦实验室",
            theme: mDefaultTheme,
            initialRoute: '/',
            //getPages: AppPages.routes,
            onGenerateRoute: onGenerateRoute));
  }
}
