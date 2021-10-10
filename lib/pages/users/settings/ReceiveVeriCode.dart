import 'package:flutter/material.dart';
import 'package:lulab/pages/users/settings/SetNewPassword.dart';

class ReceiveVeriCodePage extends StatefulWidget {
  @override
  _ReceiveVeriCodePageState createState() => _ReceiveVeriCodePageState();
}

class _ReceiveVeriCodePageState extends State<ReceiveVeriCodePage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth / 2 - 120;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '忘记密码',
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
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: [
            Text(
              '为了安全，我们会向你的手机发送验证码',
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '请输入手机号',
                hintText: '请输入手机号',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              child: Text('下一步', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetNewPassPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
