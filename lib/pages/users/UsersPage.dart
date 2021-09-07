import 'package:flutter/material.dart';
import '../../services/screenAdapter.dart';

import './favorites/MyFavorites.dart';
import './settings/settings.dart';
import './history/history.dart';
import './userspage/ContactItem.dart';
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
            //此positioned用于存放头像及标识（姓名、身份）
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: ScreenAdapter.height(240),
                width: ScreenAdapter.width(440),
                child: Stack(
                  children: [
                    //头像
                    Positioned(
                      top: ScreenAdapter.height(70),
                      left: ScreenAdapter.width(50),
                      child: CircleAvatar(
                        radius: ScreenAdapter.height(78),
                        backgroundImage: NetworkImage(
                            'https://huyaimg.msstatic.com/avatar/1083/5c/c50b386acc89c3b58dcf6225c4af0e_180_135.jpg'),
                      ),
                    ),
                    //姓名
                    Positioned(
                      top: ScreenAdapter.height(105),
                      left: ScreenAdapter.width(160),
                      child: Text(
                        '杨仕明',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    //身份
                    Positioned(
                      top: ScreenAdapter.height(165),
                      left: ScreenAdapter.width(160),
                      child: Text(
                        '功勋学员/会员',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //此positioned用于存放“设置”图标
            Positioned(
              top: ScreenAdapter.height(60),
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
            //此positioned用于存放“个人主页”按钮
            Positioned(
              top: ScreenAdapter.height(160),
              right: ScreenAdapter.width(20),
              //用Container嵌套TextButton的意义在于可以更好地控制宽高布局（Container可以设置宽高）
              child: Container(
                height: ScreenAdapter.height(80),
                width: 120,
                child: TextButton(
                  onPressed: () {},
                  child: Stack(
                    children: [
                      Positioned(
                        left: 18,
                        child: Text(
                          '个人主页',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
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
            //此处用于存放动态、粉丝、关注、累计学习栏目
            Positioned(
              top: ScreenAdapter.height(280),
              left: ScreenAdapter.width(20),
              child: Container(
                height: ScreenAdapter.height(180),
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
            //此positioned用于存放广告位
            Positioned(
              top: ScreenAdapter.height(410),
              left: ScreenAdapter.width(20),
              child: Container(
                height: ScreenAdapter.height(110),
                width: ScreenAdapter.width(710),
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
            //此positioned用于存放任务图标（购买记录、离线课程等）
            Positioned(
              top: ScreenAdapter.height(540),
              left: ScreenAdapter.width(25),
              child: Container(
                height: ScreenAdapter.height(390),
                width: ScreenAdapter.width(700),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Stack(
                  children: [
                    //“购买记录”图标
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: ScreenAdapter.width(175),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {},
                          child: Stack(
                            children: [
                              Positioned(
                                top: ScreenAdapter.height(20),
                                left: ScreenAdapter.width(45),
                                child: Container(
                                  height: ScreenAdapter.width(85),
                                  width: ScreenAdapter.width(85),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.assignment,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: ScreenAdapter.height(120),
                                left: ScreenAdapter.width(28),
                                child: Text(
                                  '购买记录',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //“离线缓存”图标
                    Positioned(
                      top: 0,
                      left: ScreenAdapter.width(175),
                      child: Container(
                        width: ScreenAdapter.width(175),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {},
                          child: Stack(
                            children: [
                              Positioned(
                                top: ScreenAdapter.height(20),
                                left: ScreenAdapter.width(45),
                                child: Container(
                                  height: ScreenAdapter.width(85),
                                  width: ScreenAdapter.width(85),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.assignment_returned_outlined,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: ScreenAdapter.height(120),
                                left: ScreenAdapter.width(28),
                                child: Text(
                                  '离线缓存',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //“我的收藏”图标
                    Positioned(
                      top: 0,
                      left: ScreenAdapter.width(370),
                      child: Container(
                        width: ScreenAdapter.width(175),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavoritesPage(),
                                ));
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                top: ScreenAdapter.height(20),
                                left: ScreenAdapter.width(45),
                                child: Container(
                                  height: ScreenAdapter.width(85),
                                  width: ScreenAdapter.width(85),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.star_border,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: ScreenAdapter.height(120),
                                left: ScreenAdapter.width(28),
                                child: Text(
                                  '我的收藏',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //“观看历史”图标
                    Positioned(
                      top: 0,
                      left: ScreenAdapter.width(545),
                      child: Container(
                        width: ScreenAdapter.width(175),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WatchHistory(),
                                ));
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                top: ScreenAdapter.height(20),
                                left: ScreenAdapter.width(45),
                                child: Container(
                                  height: ScreenAdapter.width(85),
                                  width: ScreenAdapter.width(85),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.query_builder,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: ScreenAdapter.height(120),
                                left: ScreenAdapter.width(28),
                                child: Text(
                                  '观看历史',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //“意见反馈”图标
                    Positioned(
                      top: ScreenAdapter.height(195),
                      left: 0,
                      child: Container(
                        width: ScreenAdapter.width(175),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FeedbackPage(),
                                ));
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                top: ScreenAdapter.height(20),
                                left: ScreenAdapter.width(45),
                                child: Container(
                                  height: ScreenAdapter.width(85),
                                  width: ScreenAdapter.width(85),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.announcement,
                                    size: 36,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: ScreenAdapter.height(120),
                                left: ScreenAdapter.width(28),
                                child: Text(
                                  '意见反馈',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* Positioned(
                      top: ScreenAdapter.height(195),
                      left: ScreenAdapter.width(180),
                      child: Container(
                        width: ScreenAdapter.width(180),
                        height: ScreenAdapter.height(195),
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(150),
                                    ),
                                    child: Icon(
                                      Icons.star,
                                      size: 36,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '我的会员',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ), */
                  ],
                ),
              ),
            ),
            //此positioned用于存放任务栏（在线咨询、电话咨询）
            Positioned(
              top: ScreenAdapter.height(950),
              left: ScreenAdapter.width(15),
              child: Container(
                width: ScreenAdapter.width(720),
                height: ScreenAdapter.height(240),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  children: [
                    //“在线咨询”任务栏
                    Container(
                      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30), 0,
                          ScreenAdapter.width(30), 0),
                      height: ScreenAdapter.height(100),
                      width: ScreenAdapter.width(660),
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
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 0,
                              child: Icon(
                                Icons.headset,
                                color: Colors.black,
                              ),
                            ),
                            Positioned(
                                top: 3,
                                left: 33,
                                child: Text(
                                  '在线咨询',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                )),
                            Positioned(
                              top: 7,
                              right: 3,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //“电话咨询”任务栏
                    Container(
                      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30), 0,
                          ScreenAdapter.width(30), 0),
                      height: ScreenAdapter.height(100),
                      width: ScreenAdapter.width(660),
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
                          children: [
                            Positioned(
                              top: 5,
                              left: 0,
                              child: Icon(
                                Icons.phone_in_talk,
                                color: Colors.black,
                              ),
                            ),
                            Positioned(
                                top: 5,
                                left: 33,
                                child: Text(
                                  '电话咨询',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                )),
                            Positioned(
                              top: 7,
                              right: 3,
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
