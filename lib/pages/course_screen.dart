import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("课程"),
      ),
      body: Center(
        child: Text("课程"),
      ),
    );
  }
}
