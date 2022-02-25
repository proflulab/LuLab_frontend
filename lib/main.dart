import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routers/router.dart';
import 'common/values/values.dart';
//BaiduNetdiskDownload 'package:get/get.dart';

//启动页面

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(750, 1334), //配置设计稿的宽度高度
        builder: () => MaterialApp(
            locale: const Locale('zh', 'CN'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              //GlobalCupertinoLocalizations.delegate,
              //苹果弹窗本地化处理
              GlobalCupertinoLocalizations.delegate,
              //咨询分页本地化处理
              // GlobalEasyRefreshLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English, no country code
              Locale('zh', 'CN'), // 中文简体
            ],
            debugShowCheckedModeBanner: false,
            title: "陆向谦实验室",
            theme: mDefaultTheme,
            initialRoute: '/',
            //getPages: AppPages.routes,
            onGenerateRoute: onGenerateRoute));
  }
}
