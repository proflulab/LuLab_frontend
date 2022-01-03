import 'package:flutter/material.dart';

Widget textfield({
  required BuildContext context,
  required String hinttext,
  required Widget leading,
}) {
  return TextField(
    obscureText: true,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.password_sharp),
      hintText: hinttext,
    ),
  );
}
