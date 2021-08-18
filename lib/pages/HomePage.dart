import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Center(child: Text("我是推荐区")),
        Center(child: Text("我是功勋墙")),
        Center(child: Text("我是训练营"))
      ],
    );
  }
}
