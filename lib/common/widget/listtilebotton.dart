import 'package:flutter/material.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/widget/widgets.dart';

import '../values/myicon.dart';

Widget listtilebotton({
  required BuildContext context,
  required String bottomname,
  required Widget icon,
  required VoidCallback onPressed,
}) {
  return Container(
    //margin: const EdgeInsets.only(left: 20, right: 20),
    color: Colors.white,
    child: ListTile(
      leading: icon,
      title: Text(
        bottomname,
        style: const TextStyle(
          fontFamily: 'MyFontStyle',
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      trailing: const Icon(PFIcon.userRight),
      onTap: onPressed,
    ),
  );
}

Widget listtilebotton2({
  required BuildContext context,
  required String bottomname,
  //required Widget icon,
  required VoidCallback onPressed,
}) {
  return Container(
    //margin: const EdgeInsets.only(left: 20, right: 20),
    color: Colors.white,
    child: ListTile(
      //leading: icon,
      title: Text(
        bottomname,
        style: const TextStyle(
          fontFamily: 'MyFontStyle',
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      trailing: const Icon(PFIcon.userRight),
      onTap: onPressed,
    ),
  );
}

Widget lineWidget({
  Widget? left,
  required String title,
  Widget? right,
  required Function onTap,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      onTap();
    },
    child: Container(
      height: 104.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          left ?? const SizedBox(),
          SizedBox(width: left != null ? 25.w : 0),
          PFtext.text1(text: title, fontSize: 16),
          const Spacer(),
          right ??
              Icon(
                Icons.chevron_right,
                size: 32.w,
              )
        ],
      ),
    ),
  );
}
