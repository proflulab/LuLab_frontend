import 'package:flutter/material.dart';
import 'package:lagou_flutter/case/video_view.dart';
import 'course_desc.dart';
import 'course_comment.dart';
import 'course_recom.dart';
import 'widget/hi_tab.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  // 声明tabcontroller和tab标题
  late TabController _tabController;
  List tabs = ["简介", "评价", "推荐"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("测试视频"),
          VideoView(
            'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4',
            cover: 'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
          ),
          // tab栏
          _buildTabNavigation(),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TabBarView(
                controller: _tabController,
                children: [
                  CourseDesc(),
                  CourseComment(),
                  CourseRecom(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// tab栏具体实现
  _buildTabNavigation() {
    //使用Material实现阴影效果
    return Material(
      elevation: 5,
      shadowColor: Colors.grey[100],
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        height: 39,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _tabBar(),
          ],
        ),
      ),
    );
  }

  _tabBar() {
    return HiTab(
      tabs.map<Tab>((name) {
        return Tab(
          text: name,
        );
      }).toList(),
      controller: _tabController,
    );
  }
}

// 底部弹起新页面
void bounceBottomSheet(BuildContext context, Widget bouncePage) {
  showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return bouncePage;
      });
}
