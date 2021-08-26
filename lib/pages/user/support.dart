import 'package:flutter/material.dart';
//import '../../services/screenadapter.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    //ScreenAdapter.init(context);
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 18;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '帮助与反馈中心',
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
        width: widgetwidth,
        padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
        child: Column(
          children: [
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 100,
                        child: Text(
                          '意见反馈',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 100,
                        child: Text(
                          '常见问题',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '关于账号、手机号、登录和用户名',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '关于上传、审核、编辑和删除内容',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '关于作品推荐、精彩评论和作品上榜',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '关于团体',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '关于推荐',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: widgetwidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 3,
                      child: Container(
                        height: 35,
                        width: 280,
                        child: Text(
                          '其他',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
