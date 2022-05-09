import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/global/global.dart';
import 'common/lang/translation_service.dart';
import 'common/routers/app_pages.dart';
import 'common/values/values.dart';

//启动页面
void main() {
  runApp(const MyApp());
  Global.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1624), //配置设计稿的宽度高度
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // supportedLocales: const [
          //   Locale('en', 'US'), // English, no country code
          // ],
          title: "陆向谦实验室",
          theme: mDefaultTheme,
          initialRoute: AppPages.iNITIAL,
          getPages: AppPages.routes,
          locale: TranslationService.locale,
          translations: TranslationService(),
        );
      },
    );
  }
}
