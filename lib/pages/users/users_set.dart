import 'package:flutter/material.dart';
import '../../widget/widgets.dart';

import 'users_set_user.dart';
//import 'users_set_account.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    //double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '设置',
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
          //centerTitle: true,
        ),
        body: Column(
          children: [
            listtilebotton(
                bottomname: "个人信息",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SetUser()));
                },
                context: context),
            listtilebotton(
                bottomname: "账号设置",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SetAccount()));
                },
                context: context),
            listtilebotton(
                bottomname: "软件升级",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "清理缓存",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "关于我们",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  bounceBottomSheet(context, Text("data"));
                },
                context: context),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
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
              child: TextButton(
                onPressed: () {
                  print("退出登录");
                },
                child: Text(
                  '退出登录',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
