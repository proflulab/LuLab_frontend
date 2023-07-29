import 'package:flutter/material.dart';

//import '../../common/widget/widgets.dart';
import '../../common/values/values.dart';

//陆向谦实验室APP字体规范

class PFtext {
  static Widget text1({
    //required BuildContext context,
    required String text,
    int maxLines = 2,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool softWrap = false,
    String fontFamily = "MyFontStyle",
    Color? color = PFc.textPrimary,
    double? fontSize = 15,
    FontWeight? fontWeight = FontWeight.normal,
  }) {
    return Text(
      text,
      textAlign: TextAlign.left,
      //textDirection: TextDirection.rtl,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "MyFontStyle",
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  //常规加粗字体
  static Widget text2({
    //required BuildContext context,
    required String text,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool softWrap = false,
    String font = '',
    Color? color = PFc.textPrimary,
    double? fontSize,
    FontWeight? fontWeight = FontWeight.bold,
  }) {
    return Text(
      text,
      textAlign: TextAlign.left,
      //textDirection: TextDirection.rtl,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "MyFontStyle",
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  //常规字体一，主要用在正文
  static Widget text3({
    //required BuildContext context,
    required String text,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool softWrap = false,
    String font = '',
    Color? color = PFc.textPrimary,
    double? fontSize,
    FontWeight? fontWeight = FontWeight.normal,
  }) {
    return Text(
      text,
      textAlign: TextAlign.left,
      //textDirection: TextDirection.rtl,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "MyFontStyle",
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
      ),
    );
  }

  //常规字体二，主要用在副文章
  static Widget text4({
    //required BuildContext context,
    required String text,
    int maxLines = 2,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool softWrap = false,
    String font = '',
    Color? color = PFc.textSecondary,
    double? fontSize,
    FontWeight? fontWeight = FontWeight.normal,
  }) {
    return Text(
      text,
      textAlign: TextAlign.left,
      //textDirection: TextDirection.rtl,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: "MyFontStyle",
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
