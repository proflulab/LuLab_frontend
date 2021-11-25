import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的收藏',
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
        width: screenwidth,
        child: Column(
          children: [
            Container(
              height: 160,
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
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 30,
                      width: 120,
                      child: Text(
                        '共创建一个收藏夹',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Container(
                      height: 105,
                      width: 105,
                      child: ClipRRect(
                        child: Image.network(
                          'https://www.itying.com/images/flutter/hota.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 45,
                    child: Container(
                      height: 30,
                      width: 80,
                      child: Text(
                        '我喜欢的创作',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 80,
                    child: Container(
                      height: 80,
                      width: 120,
                      child: Text(
                        '一个内容',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
