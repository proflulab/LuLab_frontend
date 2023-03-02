import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:lab/common/entitys/data_course_link.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
//import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

// 课程视频播放页面

class CourseIndexPage extends StatefulWidget {
  const CourseIndexPage({Key? key, required this.product}) : super(key: key);
  final Course product;

  @override
  _CourseIndexPageState createState() => _CourseIndexPageState();
}

class _CourseIndexPageState extends State<CourseIndexPage>
    with TickerProviderStateMixin {
  late var courseId = widget.product.id;
  late var detailId = "63c4dc110e2c7e3a6c0c4c9b";
  // late var vUrl = _focusData2.link;

  // 声明tabcontroller和tab标题
  late TabController _tabController;

  List tabs = ["简介", "评价"];

  late QueryCourseDetail _queryCourseDetail;
  List<CourseDetail> _focusData = [];

  late QueryCourseLink _queryCourseLink;
  late CourseLink _focusData2;

  late QueryCourseCatalogue _queryCourseCatalogue;
  List<CourseCatalogue> _focusData3 = [];

  int _selectIndex = 0;

  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    PFwakelock.passState(1);
    _loadCourseDetail();
    _loadCourseCatalogue();
    _loadCourseLink();
  }

  // 读取课程数据
  _loadCourseDetail() async {
    _queryCourseDetail = await GqlCourseAPI.courseDetail(
        variables: CourseDetailRequest(courseId: courseId), context: context);
    setState(() {
      _focusData = _queryCourseDetail.courseDetail;
    });
  }
  //课程目录请求
  _loadCourseCatalogue() async {
    _queryCourseCatalogue = await GqlCourseAPI.courseCatalogue(
        variables: CourseCatalogueRequest(courseId: courseId), context: context);
    setState(() {
      _focusData3 = _queryCourseCatalogue.courseCatalogue;
    });
  }
  //课程链接请求
  _loadCourseLink() async {
    _queryCourseLink = await GqlCourseAPI.courseLink(
        variables: CourseLinkRequest(detailId: detailId), context: context);
    setState(() {
      _focusData2 = _queryCourseLink.courseLink;
      player.setDataSource(_focusData2.link, autoPlay: true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
    _tabController.dispose();
    PFwakelock.passState(0);
  }

  @override
  Widget _button() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('立即开通会员开通，观看全部课程'),
    );
  }

  Widget _Vedio() {
    return Container(
        height: 300.h,
        width: 1.sw,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('立即开通会员开通，观看全部课程'),
        ));
  }

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
          Global.state == UserState.member
              ? _Vedio()
              : AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FijkView(
                    color: Colors.black,
                    player: player,
                    fit: FijkFit.ar16_9,
                  ),
                ),

          // tab栏
          _buildTabNavigation(),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: PFspace.screenMargin, right: PFspace.screenMargin),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.product.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.w, right: 0.w),
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(_focusData2.link)),
                        title: Text(
                          widget.product.author,
                          style: const TextStyle(
                              fontFamily: 'MyFontStyle',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          widget.product.description,
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
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: (114.h + 15) * _focusData3.length,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _focusData3.length,
                          itemBuilder: (context, index) {
                            if (_focusData3.isNotEmpty) {
                              return InkWell(
                                onTap: () async {
                                  setState(() {
                                    _selectIndex = index;
                                    detailId = _focusData3[index].id;
                                    _loadCourseLink();
                                  });
                                  await player.reset();
                                  player.setDataSource(
                                      _focusData2.link,
                                      autoPlay: true);
                                },
                                child: Container(
                                  height: 114.h,
                                  decoration: BoxDecoration(
                                    color: _selectIndex == index
                                        ? PFc.themeColor10
                                        : PFc.backgroundSecondary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    border: Border.all(
                                      color: _selectIndex == index
                                          ? PFc.themeColor
                                          : PFc.backgroundSecondary,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: Stack(
                                    children: <Widget>[
                                      // 课程标题
                                      positioningText(
                                        context: context,
                                        top: 25.h,
                                        left: PFspace.screenMargin,
                                        height: 80.h,
                                        width: 1.sw - PFspace.screenMargin * 4,
                                        text: _focusData[index].title,
                                        color: _selectIndex == index
                                            ? PFc.themeColor
                                            : PFc.textPrimary,
                                        font: _selectIndex == index
                                            ? 'MyFontStyle'
                                            : '',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Loading();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
