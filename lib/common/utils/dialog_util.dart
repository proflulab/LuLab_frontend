import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import '/common/utils/utils.dart';

import '../widget/text_widget.dart';

class PFDialog {
  static void showPopUp({
    String title = "提示",
    String? content,
    Widget? widget,
    double? height,
    String textConfirm = "确定",
    required Function onConfirm,
    required BuildContext context,
  }) {
    YYDialog().build(context)
      ..width = 502.w
      ..height = height
      ..borderRadius = 10
      ..text(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        text: title,
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      )
      ..widget(content == null
          ? const SizedBox(height: 0)
          : Container(
              padding: const EdgeInsets.all(20.0),
              child: PFtext.text2(text: content, fontSize: 14)))
      ..widget(widget ?? const SizedBox(height: 0))
      ..widget(Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 160.w,
                  height: 72.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.w),
                    color: const Color(0xffDFDFDF),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "取消",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 80.w),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: Container(
                  width: 160.w,
                  height: 72.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.w),
                    color: const Color(0xff4DC460),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    textConfirm,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )))
      ..show();
  }
}
