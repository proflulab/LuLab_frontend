import 'package:flutter/material.dart';
import 'manage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LuLab",
      theme: ThemeData.light(),
      home: Home(),
    );
  }
}
