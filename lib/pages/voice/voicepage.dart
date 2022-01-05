import 'package:flutter/material.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '请说话',
      ),
      content: const Text('颠覆式创新'),
      backgroundColor: Colors.lightBlueAccent,
      elevation: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      actions: <Widget>[
        TextButton(
          child: const Text('113'),
          onPressed: () {},
        ),
        TextButton(
          child: const Text('1312'),
          onPressed: () {},
        ),
      ],
    );
  }
}
