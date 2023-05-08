import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/expandText.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
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
  late var description = widget.product.description;
  late var detailId = '';
  late var addtime =  PFTime.client(
      widget.product.addTime, "ymd");

  // 声明tabcontroller和tab标题
  late TabController _tabController;

  List tabs = ["简介"];

  late QueryCourseLink _queryCourseLink;
  late CourseLink _linkData;

  late QueryCourseCatalogue _queryCourseCatalogue;
  List<CourseCatalogue> _catalogueData = [];

  int _selectIndex = 0;

  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    PFwakelock.passState(1);
    _loadCourseCatalogue();
  }

  // // 读取课程数据
  // _loadCourseDetail() async {
  //   _queryCourseDetail = await GqlCourseAPI.courseDetail(
  //       variables: CourseDetailRequest(courseId: courseId), context: context);
  //   setState(() {
  //     _detailData = _queryCourseDetail.courseDetail;
  //   });
  // }
  //课程目录请求
  _loadCourseCatalogue() async {
    _queryCourseCatalogue = await GqlCourseAPI.courseCatalogue(
        variables: CourseCatalogueRequest(courseId: courseId), context: context);
    setState(() {
      _catalogueData = _queryCourseCatalogue.courseCatalogue;
      detailId = _catalogueData[_selectIndex].id;
      _loadCourseLink(detailId);
    });
  }
  //课程链接请求
  _loadCourseLink(String _id) async {
    _queryCourseLink = await GqlCourseAPI.courseLink(
        variables: CourseLinkRequest(detailId: _id), context: context);
    setState(() {
      _linkData = _queryCourseLink.courseLink;
      player.setDataSource(_linkData.link, autoPlay: true);
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
                    // color: Colors.black,
                    player: player,
                    fit: FijkFit.ar16_9,
                    panelBuilder: fijkPanel2Builder(
                        // doubleTap:true,
                  onBack: () {
                  Navigator.pop(context);
                  },
                    ),
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
                        height: 40.h,
                      ),
                      Text(
                        widget.product.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          fontSize: 25,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '作者:${widget.product.author}',
                            style: const TextStyle(
                                fontFamily: 'MyFontStyle',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox(), // 中间用Expanded控件
                          ),
                          Text(
                            '$addtime上线',
                            style: const TextStyle(
                                fontSize: 12,
                            color: Colors.grey),
                          ),
                          const Expanded(
                            child: SizedBox(), // 中间用Expanded控件
                          ),
                        ],
                      ),
                     SizedBox(height: 20.h,),
                     ExpandText(
                              text: widget.product.description,
                              minLines: 1, // 收起状态下最大展示行数
                              maxLines: 2, // 展开后最大展示行数限制
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
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
                        height: (114.h + 15) * _catalogueData.length,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _catalogueData.length,
                          itemBuilder: (context, index) {
                            if (_catalogueData.isNotEmpty) {
                              return InkWell(
                                onTap: () async {
                                  setState(() {
                                    _selectIndex = index;
                                    detailId = _catalogueData[index].id;
                                    _loadCourseLink(_catalogueData[index].id);
                                  });
                                  await player.reset();
                                  player.setDataSource(
                                      _linkData.link,
                                      autoPlay: true);
                                  // VideoPlayerUtils.playerHandle(_linkData.link,autoPlay: true);
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
                                        text: _catalogueData[index].title,
                                        color: _selectIndex == index
                                            ? PFc.themeColor
                                            : PFc.textPrimary,
                                        font: _selectIndex == index
                                            ? 'MyFontStyle'
                                            : '',
                                      ),
                                      _catalogueData[index].free ?
                                      Positioned(
                                          top: 25.h,
                                          right: PFspace.screenMargin,
                                          child:
                                          Container(
//设置 child 居中
                                            alignment: Alignment(0, 0),
                                            height: 40.h,
                                            width: 90.w,
//边框设置
                                            decoration: const BoxDecoration(
//背景
                                              color: Colors.green,
                                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                            ),
                                            child:const Text(
                                              '试看',
                                              style: TextStyle(
                                                fontFamily: 'MyFontStyle',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),) :
                                      Positioned(
                                        top: 25.h,
                                        right: PFspace.screenMargin,
                                        child:
                                        Container(),)
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
      // elevation: 10,
      // shadowColor: Colors.grey[100],
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20.w),
        height: 90.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
