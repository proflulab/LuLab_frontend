import 'package:flutter/material.dart';

class VoicePage extends StatefulWidget {
  VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("课程"),
      ),
      body: Container(
        child: Text("我是VoicePage"),
      ),
    );
  }
}
