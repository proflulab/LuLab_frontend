import 'package:flutter/material.dart';

class WatchHistory extends StatefulWidget {
  const WatchHistory({Key? key}) : super(key: key);

  @override
  _WatchHistoryState createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '观看历史',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
