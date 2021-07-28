import 'package:flutter/material.dart';
import 'pages/course_screen.dart';
import 'pages/home_screen.dart';
import 'pages/account_screen.dart';
import 'pages/counsel_screen.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  // ignore: non_constant_identifier_names
  final _bottom_nav_color = Colors.white;

  List<Widget> btmls = [];

  late var currentIndex = 0;

  @override
  void initState() {
    btmls
      ..add(HomeView())
      ..add(CourseView())
      ..add(CounselView())
      ..add(AccountView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: btmls[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottom_nav_color,
            ),
            label: "首页",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.class__outlined,
              color: _bottom_nav_color,
            ),
            label: "课程",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sms,
              color: _bottom_nav_color,
            ),
            label: "咨询",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _bottom_nav_color,
            ),
            label: "我的",
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
