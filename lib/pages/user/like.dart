import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth / 2 - 20;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我赞过的',
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
        child: Stack(
          children: [
            Positioned(
              left: 50,
              top: 15,
              child: Container(
                height: 40,
                width: 40,
                child: Text(
                  '全部',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              left: widgetwidth,
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
              right: 50,
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
          ],
        ),
      ),
    );
  }
}
