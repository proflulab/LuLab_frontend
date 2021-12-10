import 'package:flutter/material.dart';

Widget listtilebotton({
  required BuildContext context,
  required String bottomname,
  required Widget icon,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    //color: Colors.red,
    child: ListTile(
      leading: icon,
      //selected:,
      title: Text(bottomname),
      contentPadding: EdgeInsets.all(0),
      trailing: Icon(Icons.arrow_right_alt_sharp),
      onTap: onPressed,
    ),
  );
}
