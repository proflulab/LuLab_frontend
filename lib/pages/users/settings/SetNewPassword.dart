import 'package:flutter/material.dart';
import '../../../services/screenAdapter.dart';

class SetNewPassPage extends StatefulWidget {
  @override
  _SetNewPassPageState createState() => _SetNewPassPageState();
}

class _SetNewPassPageState extends State<SetNewPassPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '重置密码',
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
        height: screenheight,
        width: screenwidth,
        child: Stack(
          children: [
            //封装提示文本
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: ScreenAdapter.height(180),
                width: screenwidth,
                //将封装好的文字居中
                child: Center(
                  //封装文字
                  child: Container(
                    height: ScreenAdapter.height(90),
                    width: ScreenAdapter.width(560),
                    /* decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                    ), */
                    child: Column(
                      children: [
                        Container(
                          height: ScreenAdapter.height(45),
                          width: ScreenAdapter.width(560),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '已向手机号',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '+86 13619731812',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange,
                                  ),
                                ),
                                TextSpan(
                                  text: '发送短信验证码',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: ScreenAdapter.height(45),
                          width: ScreenAdapter.width(560),
                          child: Text(
                            '密码需由6-20位数字、字母或符号组成，至少两种',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //封装输入框
            Positioned(
              top: ScreenAdapter.height(180),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(200),
                width: screenwidth,
                child: Center(
                  child: Container(
                    height: ScreenAdapter.height(160),
                    width: ScreenAdapter.width(560),
                    child: Column(
                      children: [
                        Container(
                          height: ScreenAdapter.height(80),
                          width: ScreenAdapter.width(560),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: '请输入验证码',
                            ),
                          ),
                        ),
                        Container(
                          height: ScreenAdapter.height(80),
                          width: ScreenAdapter.width(560),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: '设置新密码',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //封装提交按钮
            Positioned(
              top: ScreenAdapter.height(460),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(120),
                width: screenwidth,
                child: Center(
                  child: Container(
                    height: ScreenAdapter.height(100),
                    width: ScreenAdapter.width(560),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              ),
            ),
            //封装提示词
            Positioned(
              top: ScreenAdapter.height(580),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(100),
                width: screenwidth,
                child: Center(
                  child: Container(
                    height: ScreenAdapter.height(60),
                    width: ScreenAdapter.width(210),
                    child: Text(
                      '手机号已停用？',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
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
