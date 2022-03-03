import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
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
  late var vUrl = widget.product.videoUrl;

  // 声明tabcontroller和tab标题
  late TabController _tabController;

  List tabs = ["简介", "评价"];

  late DetailCourse _detailCourse;
  var _focusData;

  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _handleCourse();
  }

  // 读取所有课程数据
  _handleCourse() async {
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
          VideoView(vUrl,
              //'https://media.w3.org/2010/05/sintel/trailer.mp4',
              //'https://media.w3.org/2010/05/sintel/trailer.mp4',
              //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              cover:
                  'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
              key: UniqueKey()),
          // tab栏
          _buildTabNavigation(),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              //padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    children: [
                      const Divider(
                        color: Color(0xffe4e4e4),
                      ),
                      Text(
                        widget.product.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.w, right: 0.w),
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.product.imgUrl)),
                        title: Text(
                          widget.product.author,
                          style: const TextStyle(
                              fontFamily: 'MyFontStyle',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          widget.product.authorTags,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      // ListTile(
                      //   leading: Text(
                      //     _focusData.classTags,
                      //     style: const TextStyle(
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      //   title: Row(
                      //     children: [
                      //       Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 5),
                      //         child: const Text(
                      //           '颠覆式创新',
                      //           style: TextStyle(color: Colors.grey),
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 5),
                      //         child: const Text(
                      //           '公司',
                      //           style: TextStyle(color: Colors.grey),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     children: const [
                      //       Text(
                      //         '课程介绍',
                      //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Wrap(
                        children: [Text(widget.product.description)],
                      ),
                      const Divider(
                        color: Color(0xffe4e4e4),
                      ),
                      const Text(
                        '目录',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'MyFontStyle',
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: (114.h + 15) * _focusData.subCourses.length,
                        width: 500.w,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _focusData.subCourses.length,
                          itemBuilder: (context, index) {
                            if (_focusData.subCourses.isNotEmpty) {
                              return InkWell(
                                onTap: () async {
                                  setState(() {
                                    dirId = _focusData
                                        .subCourses[index].mainCourseId;
                                    courseId =
                                        _focusData.subCourses[index].courseId;
                                    _handleCourse();
                                    _selectIndex = index;
                                    vUrl = _focusData.videoUrl;
                                  });
                                  //_handleCourse();
                                },
                                child: Container(
                                  height: 114.h,
                                  decoration: BoxDecoration(
                                    color: _selectIndex == index
                                        ? Color.fromRGBO(6, 202, 124, 0.5)
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                    //border: Border.all(color: Colors.black54),
                                  ),
                                  margin: const EdgeInsets.all(5.0),
                                  child: Stack(
                                    children: <Widget>[
                                      // 课程标题
                                      positionedText(
                                          context: context,
                                          top: 45,
                                          left: 30,
                                          height: 40,
                                          width: 200,
                                          text: _focusData
                                              .subCourses[index].subTitle),
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
                  ),
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

  // tab栏具体实现
  _buildTabNavigation() {
    //使用Material实现阴影效果
    return Material(
      elevation: 10,
      shadowColor: Colors.grey[100],
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20.w),
        height: 50.h,
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
