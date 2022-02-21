import 'package:flutter/material.dart';
import 'package:proflu/common/api/gql_latestdetailcourse.dart';
import 'package:proflu/common/entitys/detail_coursedata.dart';

import '../../common/widget/widgets.dart';
import 'course_comment2.dart';
import 'course_detail2.dart';

/// 课程视频播放页面

class CourseIndexPageTwo extends StatefulWidget {
  const CourseIndexPageTwo({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  _CourseIndexPageTwoState createState() => _CourseIndexPageTwoState();
}

class _CourseIndexPageTwoState extends State<CourseIndexPageTwo>
    with TickerProviderStateMixin {
  late DetailCourse _detailCourse;
  var _focusData;
  late final course = widget.product;
  // 声明tabcontroller和tab标题
  late TabController _tabController;
  List tabs = ["简介", "评价"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _handleCourse();
  }

  // 读取所有课程数据
  _handleCourse() async {
    CourseRequest variables = CourseRequest(
      dirId: widget.product.mainCourseId,
      courseId: widget.product.courseId,
    );
    _detailCourse = await GqlDetailCourseAPI.indexPageInfo(
        variables: variables, context: context);
    var focusList = _detailCourse.detailCourse;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        toolbarHeight: 0,
        toolbarOpacity: 0,
        backgroundColor: (Colors.black),
      ),
      body: Column(
        children: [
          VideoView(
            widget.product.videoUrl,
            //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            cover: 'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
          ),
          // tab栏
          _buildTabNavigation(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  CourseDetailTwo(product: _focusData),
                  CourseCommentPageTwo(product: _focusData),
                  // const CourseCatalogue(),
                  // const CourseRecomPage(),
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
      elevation: 10,
      shadowColor: Colors.grey[100],
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        height: 50,
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
