import 'package:flutter/material.dart';
import 'bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomBar",
      theme: ThemeData.light(),
      home: BotomeMenumBarPage(),
    );
  }
}
