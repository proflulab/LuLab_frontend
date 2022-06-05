import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:lab/pages/source/infor_item_widget.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '../../pages/course/course_index.dart';
import '../../pages/home/live_detail.dart';

class Gather extends StatefulWidget {
  const Gather({Key? key}) : super(key: key);

  @override
  _GatherState createState() => _GatherState();
}

class _GatherState extends State<Gather> with AutomaticKeepAliveClientMixin {
  late Inforponse _postsIfoData;
  List<LatestInformation> _focusData2 = [];
  late LatestDirectCourse _latestDirectCourse;
  List<LatestDirectCourseElement> _focusData3 = [];
  late LatestDirectCourse _course;
  List<LatestDirectCourseElement> _focusData4 = [];

  //final double _coursesW = PFspace.screenW * PFr.silver - PFspace.screenMargin;

  DateTime now = DateTime.now();

  _getInitial() async {
    if (kDebugMode) {
      print('回退刷新数据');
    }
    _handleCourse();
  }

  @override
  void initState() {
    super.initState();
    _handleCourse();
    _loadIfoData();
    _loadCourse();
  }

  // 获取资讯数据
  _loadIfoData() async {
    _postsIfoData = await SourseAPI.inforInfo(
        context: context, variables: Inforrequest(limit: 2, skip: 0));

    if (mounted) {
      setState(() {
        _focusData2 = _postsIfoData.latestInformation;
      });
    }
  }

  //添加预约
  _handleRecordAdd(int index, String status) async {
    await GqlHomeAPI.recordAddInfo(
      context: context,
      variables: RecordAddRequest(
        authorId: Global.profile.id!,
        status: status,
        courseId: _focusData3[index].id,
        onlineTime: now,
      ),
    );
    toastInfo(msg: '预约成功');
  }

  // 获取直播课程预约数据
  _handleCourse() async {
    var user = Storage.getJson(storageUserProfileKey);
    user.then((guide) async {
      var user1 = Data.fromJson(json.decode(guide!));

      try {
        _latestDirectCourse = await GqlCourseAPI.sortCourseInfo(
          context: context,
          variables: LatestDirectCourseRequest(
            mode: "2",
            authorId: user1.id!,
            limit: 2,
            skip: 0,
          ),
        );
        if (mounted) {
          setState(() {
            _focusData3 = _latestDirectCourse.latestDirectCourse;
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print("===========登录报错内容===============");
          print(e);
        }
      }
    });
  }

  //获取大咖访谈课程
  _loadCourse() async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: "1",
      authorId: Global.profile.id!,
      limit: 3,
      skip: 0,
    );
    _course = await GqlCourseAPI.sortCourseInfo(
        variables: variables, context: context);

    if (mounted) {
      setState(() {
        _focusData4 = _course.latestDirectCourse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.h),
        _swiperWidget(),
        SizedBox(height: 20.h),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _titleWidget("直播预约"),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _buildLive(),
        SizedBox(height: 20.h),
        _titleWidget("最新资讯"),
        _buildInfomation(),
        SizedBox(height: 20.h),
        _titleWidget("精选课程"),
        _buildCourse(),
      ],
    );
  }

  //轮播图
  Widget _swiperWidget() {
    List imgList = [
      "https://gitee.com/shimingy/imagesbed/raw/master/img/轮播图2.png",
      "https://gitee.com/shimingy/imagesbed/raw/master/img/轮播图1.png",
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      child: AspectRatio(
        aspectRatio: 9 / 5,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              child: CachedImage.typeLaod(imgList[index]),
            );
          },
          //条目个数
          itemCount: imgList.length,
          //轮播指示符
          //control: new SwiperControl(),
          //分页指示器
          pagination: const SwiperPagination(
            //指示器显示的位置
            alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
            // 距离调整
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            // 指示器构建
            builder: DotSwiperPaginationBuilder(
              // 点之间的间隔
              space: 8,
              // 没选中时的大小
              size: 6,
              // 选中时的大小
              activeSize: 12,
              // 没选中时的颜色
              color: Colors.white,
              //选中时的颜色
              activeColor: Colors.green,
            ),
          ),
          //自动翻页
          autoplay: true,
          onTap: (index) {
            if (kDebugMode) {
              print(" 点击 " + index.toString());
            }
          },
        ),
      ),
    );
  }

  //栏目名称
  Widget _titleWidget(value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      height: 80.w,
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontFamily: 'MyFontStyle',
          fontSize: 18,
        ),
      ),
    );
  }

  //直播预约-写法二
  _buildLive() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _focusData3.length,
            itemBuilder: (context, index) {
              if (_focusData3.isNotEmpty) {
                return InkResponse(
                  onTap: () async {
                    if (kDebugMode) {
                      print('到课程详情');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LiveDetail(product: _focusData3[index]),
                      ),
                    ).then((value) => _getInitial());
                  },
                  child: Container(
                    padding: EdgeInsets.all(PFspace.screenMargin),
                    height: PFspace.screenW * PFr.bronze,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        tagImage(
                          context: context,
                          width: (PFspace.screenW * PFr.bronze -
                                  2 * PFspace.screenMargin) /
                              PFr.silver,
                          height: PFspace.screenW * PFr.bronze -
                              2 * PFspace.screenMargin,
                          url: _focusData3[index].imgUrl,
                          tag: _focusData3[index].category,
                        ),
                        SizedBox(width: PFspace.ruleS),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PFtext.text1(
                                text: _focusData3[index].title,
                                fontSize: PFfont.s32,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  PFtext.text2(
                                      text: _focusData3[index].author,
                                      color: PFc.textSecondary,
                                      fontSize: PFfont.c24),
                                  const SizedBox(width: 10),
                                  PFtext.text2(
                                    text: _focusData3[index].authorTags,
                                    fontSize: PFfont.c24,
                                    fontWeight: FontWeight.normal,
                                    color: PFc.textSecondary,
                                  ),
                                ],
                              ),
                              Flexible(child: Container(width: 10.w)),
                              Row(
                                children: [
                                  PFtext.text2(
                                    text: PFTime.client(
                                        _focusData3[index].onlineTime, "md"),
                                    fontSize: PFfont.c24,
                                    fontWeight: FontWeight.normal,
                                    color: PFc.textSecondary,
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(child: Container(height: 10.h)),
                                  SizedBox(
                                    width: 120.w,
                                    height: 50.w,
                                    child: ElevatedButton(
                                      child: _focusData3[index].status == "0"
                                          ? const Text("预约")
                                          : const Text("已预约"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          _focusData3[index].status == "0"
                                              ? Colors.green
                                              : Colors.grey,
                                        ), //背景颜色
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white), //字体颜色
                                        overlayColor: MaterialStateProperty.all(
                                            const Color(0xffFFF8E5)), // 高亮色
                                        shadowColor: MaterialStateProperty.all(
                                            const Color(0xffffffff)), //阴影颜色
                                        elevation:
                                            MaterialStateProperty.all(0), //阴影值
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'MyFontStyle',
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          StadiumBorder(
                                            side: BorderSide(
                                              style: BorderStyle.solid,
                                              color:
                                                  _focusData3[index].status ==
                                                          "0"
                                                      ? Colors.green
                                                      : Colors.grey,
                                            ),
                                          ),
                                        ),
                                        //圆角弧度
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(5, 0)),
                                      ),
                                      onPressed: () {
                                        if (_focusData3[index].status == "0") {
                                          //执行日历预约方法
                                          _handleRecordAdd(index, "1");
                                          Calendar.createEvent(
                                            _focusData3[index].title,
                                            _focusData3[index].description,
                                            DateTime.fromMillisecondsSinceEpoch(
                                                _focusData3[index].onlineTime),
                                            _focusData3[index].duration,
                                          );
                                          //执行预约方法
                                          setState(() {
                                            _handleCourse();
                                          });
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LiveDetail(
                                                product: _focusData3[index]),
                                          ),
                                        ).then((value) => _getInitial());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Loading();
              }
            },
          )
        ],
      ),
    );
  }

  //最新资讯
  _buildInfomation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _focusData2.length,
            itemBuilder: (context, index) {
              return InfoItemWidget(
                information: _focusData2[index],
                margin: false,
              );
            },
          ),
        ],
      ),
    );
  }

  //精选课程
  _buildCourse() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _focusData4.length,
            itemBuilder: (context, index) {
              if (_focusData4.isNotEmpty) {
                return InkResponse(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseIndexPage(product: _focusData4[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(PFspace.screenMargin),
                    height: PFspace.screenW * PFr.bronze,
                    decoration: const BoxDecoration(
                      //color: Color.fromARGB(255, 227, 39, 39),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (PFspace.screenW * PFr.bronze -
                                  2 * PFspace.screenMargin) /
                              PFr.silver,
                          height: PFspace.screenW * PFr.bronze -
                              2 * PFspace.screenMargin,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            child: CachedImage.typeLaod(
                                _focusData4[index].coverUrl),
                          ),
                        ),
                        SizedBox(width: PFspace.ruleS),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PFtext.text1(
                                text: _focusData4[index].title,
                                fontSize: PFfont.s32,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  PFtext.text2(
                                    text: _focusData4[index].author,
                                    color: PFc.textSecondary,
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: PFtext.text3(
                                      text: _focusData4[index].authorTags,
                                      color: PFc.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(child: Container(width: 10.w)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Loading();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
