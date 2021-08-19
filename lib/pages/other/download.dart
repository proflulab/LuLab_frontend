import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  Download({Key? key}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是下载缓存区"),
      ),
      body: Text("我是下载缓存区"),
    );
  }
}
