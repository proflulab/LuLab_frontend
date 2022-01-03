import 'package:flutter/material.dart';
import '../../values/myIcon.dart';

Widget listtilebotton({
  required BuildContext context,
  required String bottomname,
  required Widget icon,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20),
    color: Colors.white,
    child: ListTile(
      leading: icon,
      title: Text(bottomname),
      contentPadding: const EdgeInsets.all(0),
      trailing: const Icon(MyIcon.user_right),
      onTap: onPressed,
    ),
  );
}
