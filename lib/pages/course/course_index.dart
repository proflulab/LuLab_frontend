import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/api/gql_latestdetailcourse.dart';
import 'package:proflu/common/entitys/detail_coursedata.dart';

import '../../common/widget/widgets.dart';
import 'course_comment.dart';

/// 课程视频播放页面

class CourseIndexPage extends StatefulWidget {
  const CourseIndexPage({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  _CourseIndexPageState createState() => _CourseIndexPageState();
}

class _CourseIndexPageState extends State<CourseIndexPage>
    with TickerProviderStateMixin {
  late var dirId = widget.product.id;
  late var courseId = widget.product.firstCourseId;
  // 声明tabcontroller和tab标题
  late TabController _tabController;
  List tabs = ["简介", "评价"];

  late DetailCourse _detailCourse;
  var _focusData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _handleCourse();
  }

  // 读取所有课程数据
  _handleCourse() async {
    print('=====================================================39');
    CourseRequest variables = CourseRequest(dirId: dirId, courseId: courseId);
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

  //
  // void changeName() {
  //   setState(() {
  //     this.dirId = _focusData.subCourses[index].mainCourseId;
  //     this.courseId = widget.product.mainCourseId;
  //   });
  //   _handleCourse();
  // }

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
            // widget.product.videoUrl,
            'https://media.w3.org/2010/05/sintel/trailer.mp4',
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
                  buildCourseDetail(),
                  CourseCommentPage(product: widget.product),
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

  //课程简介
  ListView buildCourseDetail() {
    print('===========================31');
    print(_focusData.title);
    return ListView(
      children: [
        const Divider(
          color: Color(0xffe4e4e4),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '课程名称:' + _focusData.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'MyFontStyle',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            '作者：' + _focusData.author,
            style: const TextStyle(
                fontFamily: 'MyFontStyle',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            _focusData.authorTags,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Text(
            _focusData.classTags,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '颠覆式创新',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '公司',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                '课程介绍',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Wrap(
            children: [Text(_focusData.description)],
          ),
        ),
        const Text(
          '课程目录',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'MyFontStyle',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 800.h,
          width: 500.w,
          child: ListView.builder(
            itemCount: _focusData.subCourses.length,
            itemBuilder: (context, index) {
              if (_focusData.subCourses.isNotEmpty) {
                return InkWell(
                  onTap: () async {
                    print(
                        '==================================================================131');
                    print(_focusData.subCourses[index].subTitle);
                    print('到课程详情');
                    setState(() {
                      this.dirId = _focusData.subCourses[index].mainCourseId;
                      this.courseId = _focusData.subCourses[index].courseId;
                    });
                    _handleCourse();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CourseIndexPage(
                    //             product: _focusData.subCourses[index])));
                  },
                  child: Container(
                    height: 150.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      //border: Border.all(color: Colors.black54),
                    ),
                    margin: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        // 课程标题
                        positionedText(
                            context: context,
                            top: 30,
                            left: 190,
                            height: 40,
                            width: 200,
                            text: _focusData.subCourses[index].subTitle),
                      ],
                    ),
                  ),
                );
              } else {
                return const Text('加载中...');
              }
            },
          ),
        ),
      ],
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
