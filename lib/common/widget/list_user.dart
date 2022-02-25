import 'package:flutter/material.dart';
//import 'package:lulab/values/values.dart';

Widget listGroup1({
  required BuildContext context,
  required String title,
  required TextEditingController textController,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.black,
              fontSize: 18,
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
  required Widget icon,
  required Widget child,
  required VoidCallback onTap,
}) {
  return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'MyFontStyle',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: child,
            ),
            Expanded(flex: 1, child: icon)
          ],
        ),
      ));
}
