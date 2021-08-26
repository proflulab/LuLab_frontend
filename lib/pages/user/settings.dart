import 'package:flutter/material.dart';
import 'package:lulab/pages/settings/acmanage.dart';
import 'package:lulab/pages/settings/aboutlu.dart';
import 'package:lulab/pages/settings/meinform.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 3 * 2;
    bool switchValue = true;
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
        centerTitle: true,
      ),
      body: Container(
        width: widgetwidth,
        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 100,
                      child: Text(
                        '账号管理',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AcManagePage(),
                            ));
                      },
                    ),
                  ),
                ],
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 100,
                      child: Text(
                        '消息通知',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeInformPage(),
                            ));
                      },
                    ),
                  ),
                ],
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 200,
                      child: Text(
                        '2G/3G/4G/5G网络下载图片',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Switch(
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = !switchValue;
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                  ),
                ],
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 7,
                    top: 7,
                    child: Container(
                        height: 35, width: 40, child: Icon(Icons.delete)),
                  ),
                  Positioned(
                    left: 47,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 80,
                      child: Text(
                        '清除缓存',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      height: 30,
                      width: 40,
                      child: Text(
                        '0,0B',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 100,
                      child: Text(
                        '关于陆小创',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutLuPage(),
                            ));
                      },
                    ),
                  ),
                ],
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Container(
                      height: 35,
                      width: 100,
                      child: Text(
                        '退出登录',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {},
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
