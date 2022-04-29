import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../values/values.dart';

/// 输入框
Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  required double marginTop,
  bool isPassword = false,
  bool autofocus = false,
  double width = 100,
  double height = 40,
}) {
  return Container(
      width: width.w,
      height: height.h,
      margin: EdgeInsets.only(top: marginTop.h),
      decoration: BoxDecoration(
        color: const Color(0xfff1f1f1),
        borderRadius: PFRadius.a15,
      ),
      child: Center(
        child: TextField(
          autofocus: autofocus,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: PFc.textPrimary,
            fontFamily: "MyFontStyle",
            fontWeight: FontWeight.w400,
            fontSize: fitFontSize(35),
          ),
          maxLines: 1,
          autocorrect: false, // 自动纠正
          obscureText: isPassword, // 隐藏输入内容, 密码框
        ),
      ));
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: fitHeight(44),
    margin: EdgeInsets.only(top: fitHeight(marginTop)),
    decoration: BoxDecoration(
      color: PFc.backgroundPrimary,
      borderRadius: PFRadius.a6,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: const TextStyle(
          color: PFc.textPrimary,
        ),
      ),
      style: TextStyle(
        color: PFc.textPrimary,
        fontFamily: "MyFontStyle",
        fontWeight: FontWeight.w400,
        fontSize: fitFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
