import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的创作',
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
      body: Container(
        height: 60,
        width: screenwidth,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Stack(children: [
          Positioned(
            left: 60,
            top: 15,
            child: Container(
              height: 40,
              width: 40,
              child: Text(
                '作品',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: 80,
            top: 15,
            child: Container(
              height: 40,
              width: 40,
              child: Text(
                '文章',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
