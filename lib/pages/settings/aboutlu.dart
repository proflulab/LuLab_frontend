import 'package:flutter/material.dart';

class AboutLuPage extends StatefulWidget {
  @override
  _AboutLuPageState createState() => _AboutLuPageState();
}

class _AboutLuPageState extends State<AboutLuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '关于陆小创',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
