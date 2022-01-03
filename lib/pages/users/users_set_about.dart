import 'package:flutter/material.dart';

class SetAbout extends StatefulWidget {
  const SetAbout({Key? key}) : super(key: key);
  @override
  _SetAboutState createState() => _SetAboutState();
}

class _SetAboutState extends State<SetAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '关于实验室',
          ),
        ),
        body: Column());
  }
}
