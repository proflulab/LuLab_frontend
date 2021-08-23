import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // logo
          Container(
            height: 100,
            width: 100,
            // 上边距
            margin: EdgeInsetsDirectional.only(top: 30),
            child: Center(
              // logo 文本
              child: Text(
                "lulab",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              // logo 背景色
              color: Color(0xff2a67fe),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // 微信登录
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 100),
            child: ElevatedButton(
              style: ButtonStyle(
                  // 微信登录边框
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  // 背景颜色
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff2a67fe))),
              child: Text(
                // 文本颜色
                "微信登录",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                print("微信登录");
              },
            ),
          ),
          // 手机号登录
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 25),
            child: ElevatedButton(
              // 边框
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      // 背景颜色
                      MaterialStateProperty.all(Color(0xffeaeeff))),
              child: Text(
                // 文本颜色
                "手机号登录",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff2c6eff),
                ),
              ),
              onPressed: () {
                print("手机号登录");
              },
            ),
          ),
          // 左右链接
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "手机验证登录",
                  style: TextStyle(color: Color(0xff8a8a8a)),
                ),
                Text(
                  "账号密码登录",
                  style: TextStyle(color: Color(0xff8a8a8a)),
                ),
              ],
            ),
          ),
          // 其他登录方式
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "其他登录方式",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffadadad),
              ),
            ),
          ),
          // 协议
          protocolButton(),
        ],
      ),
    );
  }

  Container protocolButton() {
    return Container(
        width: 350,
        height: 40,
        // 上边距
        margin: EdgeInsets.only(top: 50),
        child: Text(
          "同意用户协议与隐私政策",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffadadad),
          ),
        ));
  }
}
