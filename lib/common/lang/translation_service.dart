import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'en_us.dart';
import 'zh_hans.dart';
import 'zh_hk.dart';

/*

https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html

*/

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enus,
        'zh_Hans': zhhans,
        'zh_HK': zhHK,
      };
}
