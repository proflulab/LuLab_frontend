import 'package:flutter/material.dart';

class WatchHistory extends StatefulWidget {
  @override
  _WatchHistoryState createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '观看历史',
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
