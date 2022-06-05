import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import '/common/utils/utils.dart';

import '../widget/text_widget.dart';

class DialogUtil {
  static void showPopUp({
    String title = "提示",
    String content = "",
    required Function onConfirm,
    required BuildContext context,
  }) {
    YYDialog().build(context)
      ..width = 502.w
      ..height = 244.w
      ..borderRadius = 10
      ..widget(SizedBox(
        height: 244.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PFtext.text2(text: title, fontSize: 16),
            SizedBox(height: 20.w),
            PFtext.text2(text: content, fontSize: 14),
            SizedBox(height: 30.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 180.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.w),
                      color: const Color(0xffDFDFDF),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "取消",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  child: Container(
                    width: 180.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.w),
                      color: const Color(0xff4DC460),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "确定",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ))
      ..show();
  }
}
