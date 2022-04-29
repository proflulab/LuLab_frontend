import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';
//import 'package:lulab/values/values.dart';

Widget listGroup1({
  required BuildContext context,
  required String title,
  required TextEditingController textController,
}) {
  return SizedBox(
    height: 70.h,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: TextField(
            //自动获取焦点
            //autofocus: true,
            textAlign: TextAlign.right,
            controller: textController, //设置controller
            decoration: const InputDecoration.collapsed(hintText: "编辑内容"),
          ),
        ),
      ],
    ),
  );
}

Widget listGroup2({
  required BuildContext context,
  required String title,
  Widget? icon,
  required Widget child,
  required VoidCallback onTap,
}) {
  return SizedBox(
    height: 60.h,
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          child,
          Expanded(flex: 0, child: icon ?? Container())
        ],
      ),
    ),
  );
}
