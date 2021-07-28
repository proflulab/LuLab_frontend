import 'package:flutter/material.dart';
import './bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "bottomDemo",
      theme: ThemeData.light(),
      home: BottomNavigationBarDemo(),
    );
  }
}
