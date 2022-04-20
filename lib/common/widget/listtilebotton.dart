import 'package:flutter/material.dart';

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
      trailing: const Icon(MyIcon.userRight),
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
      trailing: const Icon(MyIcon.userRight),
      onTap: onPressed,
    ),
  );
}
