import 'package:flutter/material.dart';

Widget combotton({
  required BuildContext context,
  required String bottomname,
  required Widget icon,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          width: 90,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                  child: icon,
                ),
                Text(bottomname,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        color: Colors.black))
              ],
            ),
          )));
}
