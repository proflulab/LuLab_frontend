import 'package:flutter/material.dart';
import '../values/values.dart';
import '../utils/utils.dart';

/// 输入框
Widget inputTextEdit(
    {required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required String hintText,
    bool isPassword = false,
    bool autofocus = false,
    double width = 100,
    double height = 40,
    Color color = const Color.fromRGBO(243, 243, 240, 1),
    Widget? suffixIcon}) {
  return Container(
    width: width,
    height: height,
    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
    constraints: BoxConstraints(maxHeight: 96.h, minHeight: 56.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: color,
      border: Border.all(
          width: 1,
          color: controller.text.isNotEmpty
              ? PFc.themeColor
              : const Color.fromARGB(0, 0, 0, 0)),
    ),
    child: Center(
      child: TextField(
        autofocus: autofocus,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          //isCollapsed: true,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        style: TextStyle(
          color: PFc.textPrimary,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: fitFontSize(35),
        ),
        maxLines: 1,
        autocorrect: false, // 自动纠正
        obscureText: isPassword, // 隐藏输入内容, 密码框
        onChanged: (value) {},
      ),
    ),
  );
}

class PFTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? color;
  final bool autofocus;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final FocusNode focusNode;
  const PFTextField({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.autofocus = false,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<PFTextField> createState() => _PFTextFieldState();
}

class _PFTextFieldState extends State<PFTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      constraints: BoxConstraints(maxHeight: 96.h, minHeight: 56.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: widget.color,
        border: Border.all(
            width: 1,
            color: widget.focusNode.hasFocus
                ? PFc.themeColor
                : const Color.fromARGB(0, 0, 0, 0)),
      ),
      child: Center(
        child: TextField(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          controller: widget.controller,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: widget.hintText,
            // contentPadding:
            //     const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            //isCollapsed: true,
            border: InputBorder.none,
            suffixIcon: widget.suffixIcon,
          ),
          style: TextStyle(
            color: PFc.textPrimary,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w400,
            fontSize: fitFontSize(35),
          ),
          maxLines: 1,
          autocorrect: false, // 自动纠正
          obscureText: widget.obscureText, // 隐藏输入内容, 密码框
          onTap: () {
            print("object");
          },
          onChanged: (value) {
            setState(() {
              print(value);
            });
          },
        ),
      ),
    );
  }
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
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: fitFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
