import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

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
        title: const Text(
          '我的收藏',
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
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SizedBox(
        width: screenwidth,
        child: Column(
          children: [
            Container(
              height: 160,
              width: screenwidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black12,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 20,
                    top: 10,
                    child: SizedBox(
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
                    child: SizedBox(
                      height: 105,
                      width: 105,
                      child: ClipRRect(
                          child: Image.asset('assets/images/logo.png')),
                    ),
                  ),
                  const Positioned(
                    left: 150,
                    top: 45,
                    child: SizedBox(
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
                  const Positioned(
                    left: 150,
                    top: 80,
                    child: SizedBox(
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
