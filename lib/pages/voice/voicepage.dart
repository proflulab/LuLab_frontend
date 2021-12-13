import 'package:flutter/material.dart';

class VoicePage extends StatefulWidget {
  VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '请说话',
        
      ),
      content: Text('颠覆式创新'),
      backgroundColor: Colors.lightBlueAccent,
      elevation: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      actions: <Widget>[
        TextButton(
          child: Text('113'),
          onPressed: () {},
        ),
        TextButton(
          child: Text('1312'),
          onPressed: () {},
        ),
      ],
    );
  }
}
