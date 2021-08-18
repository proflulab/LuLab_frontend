import 'package:flutter/material.dart';

class VoicePage extends StatefulWidget {
  VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("我是VoicePage"),
    );
  }
}
