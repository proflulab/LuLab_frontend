import 'package:flutter/material.dart';
import 'Optimization.dart';
import '../../../services/screenAdapter.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = ScreenAdapter.getScreenWidth();
    double screenheight = ScreenAdapter.getScreenHeight();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '意见反馈',
          style: TextStyle(color: Colors.black),
        ),
        //appbar左侧返回按钮
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
        height: screenheight,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: ScreenAdapter.height(200),
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: ScreenAdapter.height(20),
                      left: ScreenAdapter.width(40),
                      child: Container(
                        height: ScreenAdapter.height(50),
                        width: ScreenAdapter.width(260),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '反馈类型',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '（必选）',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenAdapter.height(80),
                      left: ScreenAdapter.width(40),
                      child: Container(
                        child: Optimization(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(200),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(200),
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: ScreenAdapter.height(20),
                      left: ScreenAdapter.width(40),
                      child: Container(
                        height: ScreenAdapter.height(50),
                        width: ScreenAdapter.width(260),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '反馈内容',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '（必填）',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenAdapter.height(80),
                      left: ScreenAdapter.width(40),
                      child: Container(
                        height: 20,
                        width: 220,
                        child: Text('请输入内容，感谢您的反馈！'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(420),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(300),
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                    top: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Container(
                        height: 20,
                        width: 120,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '添加图片',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '（选填）',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 20,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              size: 28,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Container(
                        height: 20,
                        width: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          '0/5',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(740),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(180),
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                    top: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Container(
                        height: 20,
                        width: 120,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '联系方式',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '（必填）',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(940),
              left: ScreenAdapter.width(150),
              child: Container(
                height: 40,
                width: ScreenAdapter.width(450),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '提交',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
