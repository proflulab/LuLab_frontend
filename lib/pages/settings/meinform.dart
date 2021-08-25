import 'package:flutter/material.dart';
import '../../services/screenadapter.dart';

class MeInformPage extends StatefulWidget {
  @override
  _MeInformPageState createState() => _MeInformPageState();
}

class _MeInformPageState extends State<MeInformPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 18;
    bool switchValue = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '消息通知',
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
              height: 55,
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
                      top: 7,
                      child: Container(
                        height: 35,
                        width: 100,
                        child: Text(
                          '评论我',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
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
            ),
            Container(
              height: 55,
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
                      top: 7,
                      child: Container(
                        height: 35,
                        width: 100,
                        child: Text(
                          '私信我',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
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
            ),
            Container(
              height: 55,
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
                      top: 7,
                      child: Container(
                        height: 35,
                        width: 100,
                        child: Text(
                          '赞我',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
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
            ),
            Container(
              height: 55,
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
                      top: 7,
                      child: Container(
                        height: 35,
                        width: 100,
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
                      right: 0,
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
            ),
          ],
        ),
      ),
    );
  }
}
