import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseDetail(),
    );
  }
}

class CourseDetail extends StatelessWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 视频
          buildVideo(),
          // 菜单栏
          buildMenu(),
          Divider(
            color: Colors.grey,
          ),
          // 简介
          buildDesc(),
          // 收藏、缓存、分享
          buildFavDownShare(),
          // 目录
          buildCatalog(),
        ],
      ),
    );
  }

  Container buildVideo() {
    return Container(
      width: double.infinity,
      height: 240,
      child: Image(
        image: AssetImage('images/a.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  Container buildMenu() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '简介',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '评价',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '推荐',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container buildDesc() {
    return Container(
        child: Column(
      children: [
        ListTile(
          title: Text('颠覆式创新'),
          subtitle: Text('陆向谦 实验室创始人\n 2021年7月9日上线 989次播放'),
        ),
        ListTile(
          title: Text('清华大学，介绍。。。'),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
        )
      ],
    ));
  }

  Container buildFavDownShare() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.star,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.download,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.share,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Column buildCatalog() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '目录',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
              ListTile(
                title: Text('第一节：大公司被颠覆的底层原因\n25分钟'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
