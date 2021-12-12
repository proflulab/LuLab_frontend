import 'package:flutter/material.dart';

Widget combotton({
  required BuildContext context,
  required String bottomname,
  required Widget icon,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 90,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(246, 246, 246, 1),
                  child: icon,
                ),
                Text(bottomname,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        color: Colors.black))
              ],
            ),
          )));
}
