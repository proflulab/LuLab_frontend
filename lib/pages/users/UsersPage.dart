import 'package:flutter/material.dart';
import '../../services/screenAdapter.dart';
import '../widgets/ContactItem.dart';

import './favorites/MyFavorites.dart';
import './settings/settings.dart';
import './history/history.dart';

import './advice_online/AdviceOnline.dart';
import './feedback/Feedback.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度、高度
    double screenwidth = ScreenAdapter.getScreenWidth();
    double screenheight = ScreenAdapter.getScreenHeight();
    return Scaffold(
      appBar: null,
      body: Container(
        height: screenheight,
        width: screenwidth,
        //设置渐变色
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlueAccent,
              //Color.fromRGBO灰色前三个数值相等，一般设置128，第四位是透明度，在0~1之间
              Color.fromRGBO(128, 128, 128, 0.05),
            ],
            //colors数组与stops数组一一对应，分别为两个颜色的起始点
            stops: [0.0, 0.3],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: ScreenAdapter.height(40),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(220),
                width: screenwidth,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: ScreenAdapter.height(220),
                        width: ScreenAdapter.width(180),
                        child: CircleAvatar(
                          radius: ScreenAdapter.width(60),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: ScreenAdapter.width(200),
                      child: Container(
                        height: ScreenAdapter.height(220),
                        width: ScreenAdapter.width(360),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: ScreenAdapter.height(100),
                          width: ScreenAdapter.width(160),
                          child: Column(
                            children: [
                              Container(
                                height: ScreenAdapter.height(50),
                                width: ScreenAdapter.width(360),
                                child: Text(
                                  '杨仕明',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenAdapter.height(50),
                                width: ScreenAdapter.width(360),
                                child: Text(
                                  '功勋学员/会员',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenAdapter.height(20),
                      right: ScreenAdapter.width(40),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenAdapter.height(120),
                      right: ScreenAdapter.width(40),
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: ScreenAdapter.height(60),
                          width: ScreenAdapter.width(180),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '个人主页',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black,
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
              top: ScreenAdapter.height(260),
              left: 0,
              child: Container(
                height: ScreenAdapter.height(140),
                width: screenwidth,
                child: Center(
                  child: Container(
                    height: ScreenAdapter.height(140),
                    width: ScreenAdapter.width(720),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ContactItem(
                          count: '56',
                          title: '动态',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '78',
                          title: '关注',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '90',
                          title: '粉丝',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '12',
                          title: '累计学习',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(400),
              left: ScreenAdapter.width(25),
              child: Container(
                height: ScreenAdapter.height(120),
                width: ScreenAdapter.width(700),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Center(
                  child: Text(
                    '广告位',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(540),
              left: ScreenAdapter.width(25),
              child: Container(
                height: ScreenAdapter.height(280),
                width: ScreenAdapter.width(700),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Wrap(
                  children: [
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(175),
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(175),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.assignment,
                                  size: 27,
                                  color: Colors.black,
                                ),
                                Text(
                                  '购买记录',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(175),
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(175),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.assignment_returned_outlined,
                                  size: 27,
                                  color: Colors.black,
                                ),
                                Text(
                                  '离线缓存',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(175),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoritesPage(),
                              ));
                        },
                        child: Container(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(175),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 27,
                                  color: Colors.black,
                                ),
                                Text(
                                  '我的收藏',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(175),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WatchHistory(),
                              ));
                        },
                        child: Container(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(175),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.query_builder,
                                  size: 27,
                                  color: Colors.black,
                                ),
                                Text(
                                  '观看历史',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenAdapter.height(140),
                      width: ScreenAdapter.width(175),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeedbackPage(),
                              ));
                        },
                        child: Container(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(175),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.announcement,
                                  size: 27,
                                  color: Colors.black,
                                ),
                                Text(
                                  '意见反馈',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenAdapter.height(840),
              left: ScreenAdapter.width(25),
              child: Container(
                height: ScreenAdapter.height(300),
                width: ScreenAdapter.width(700),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(50), 0,
                          ScreenAdapter.width(50), 0),
                      padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                      height: ScreenAdapter.height(100),
                      width: ScreenAdapter.width(600),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdviceOnlinePage(),
                              ));
                        },
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.headset,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Text(
                                '在线咨询',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
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
                      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(50), 0,
                          ScreenAdapter.width(50), 0),
                      padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                      height: ScreenAdapter.height(100),
                      width: ScreenAdapter.width(600),
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
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.phone_in_talk,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Text(
                                '电话咨询',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
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
            ),
          ],
        ),
      ),
    );
  }
}
