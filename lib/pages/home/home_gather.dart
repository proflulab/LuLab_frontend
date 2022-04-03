import 'package:alarm_calendar/alarm_calendar.dart';
import 'package:alarm_calendar/calendars.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../pages/course/course_index.dart';
import '../../pages/source/infor_details.dart';
import 'live_detail.dart';

class Gather extends StatefulWidget {
  const Gather({Key? key}) : super(key: key);

  @override
  _GatherState createState() => _GatherState();
}

class _GatherState extends State<Gather> {
  late Inforponse _postsIfoData;
  List<LatestInformation> _focusData2 = [];
  late LatestDirectCourse _latestDirectCourse;
  List<LatestDirectCourseElement> _focusData3 = [];
  late LatestDirectCourse _course;
  List<LatestDirectCourseElement> _focusData4 = [];
  final double _coursesW = PFspace.screenW * PFr.silver - PFspace.screenMargin;
  //late RecordAdd _recordAdd;
  //late RecordAddClass _recordData;

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

  // 读取资讯所有数据
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
  _handleRecordAdd(int index) async {
    RecordAddRequest variables = RecordAddRequest(
      authorId: Global.profile.id,
      status: "1",
      courseId: _focusData3[index].id,
      onlineTime: now,
    );
    await GqlHomeAPI.recordAddInfo(variables: variables, context: context);
    toastInfo(msg: '预约成功');
  }

  // 读取直播课程数据
  _handleCourse() async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: "2",
      authorId: Global.profile.id,
      limit: 2,
      skip: 0,
    );
    _latestDirectCourse = await GqlCourseAPI.sortCourseInfo(
        variables: variables, context: context);

    if (mounted) {
      setState(() {
        _focusData3 = _latestDirectCourse.latestDirectCourse;
      });
    }
  }

  _loadCourse() async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: "1",
      authorId: Global.profile.id,
      limit: 10,
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

  Future<void> createEvent(Calendars calendars) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then(
      (res) async {
        if (res != null) {
          //查询是否有写权限
          await AlarmCalendar.CheckWritePermission().then(
            (resWrite) async {
              if (resWrite != null) {
                final id = await AlarmCalendar.createEvent(calendars);
                calendars.setEventId = id!;
                if (kDebugMode) {
                  print('获得ID为：' + id);
                }
              }
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(height: 20.h),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _titleWidget("直播预约"),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _buildLive(),
        SizedBox(height: 20.h),
        _titleWidget("最新资讯"),
        buildInfomation(),
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
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(imgList[index]), // 图片数组
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(10.0),
            //     ),
            //   ),
            // );
          },
          //条目个数
          itemCount: imgList.length,
          //轮播指示符
          //control: new SwiperControl(),
          //分页指示器
          pagination: buildSwiperPagination(),
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

  //自定圆点分页指示器
  buildSwiperPagination() {
    // 分页指示器
    return const SwiperPagination(
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
      height: 40.h,
      child: Row(
        children: [
          Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(
              //fontFamily: 'MyFontStyle',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  //直播预约
  Container _buildLive() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      height: (PFspace.screenW - PFspace.screenMargin) *
          PFr.bronze *
          _focusData3.length,
      width: PFspace.screenW - PFspace.screenMargin * 2,
      child: buildLiveContext(),
    );
  }

  //直播预约模块
  ListView buildLiveContext() {
    double pieceW = PFspace.screenW - PFspace.screenMargin;
    double pieceH = pieceW * PFr.bronze;

    double imageH = pieceW * PFr.bronze - PFspace.ruleM * 2;
    double imageW = imageH / PFr.silver;

    double textL = imageH / PFr.silver + PFspace.screenMargin + PFspace.ruleS;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _focusData3.length,
      itemBuilder: (context, index) {
        var now2 = _focusData3[index].onlineTime;
        var future = DateTime.fromMillisecondsSinceEpoch(now2);
        String time = formatDate(future, [mm, '月', dd, '日']);
        var futureYear = int.parse(formatDate(future, [yyyy]));
        var futureMounth = int.parse(formatDate(future, [mm]));
        var futureDay = int.parse(formatDate(future, [dd]));
        var futureHour = int.parse(formatDate(future, [HH]));
        var futureMinute = int.parse(formatDate(future, [nn]));
        var status = _focusData3[index].status;
        Calendars calendars = Calendars(
          DateTime(
            int.parse(TimeChange.client(_focusData3[index].onlineTime, "y")),
            futureMounth,
            futureDay,
            futureHour,
            futureMinute,
          ),
          DateTime(
            futureYear,
            futureMounth,
            futureDay,
            futureHour,
            futureMinute,
          ).add(
            Duration(minutes: _focusData3[index].duration),
          ),
          _focusData3[index].title,
          _focusData3[index].description,
          [5],
          '1',
          1,
        );
        if (_focusData3.isNotEmpty) {
          return InkWell(
            onTap: () async {
              if (kDebugMode) {
                print('到课程详情');
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LiveDetail(product: _focusData3[index]),
                ),
              ).then((value) => _getInitial());
            },
            child: Container(
              width: pieceW,
              height: pieceH,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Stack(
                children: <Widget>[
                  // 课程封面
                  Positioned(
                    top: PFspace.ruleM,
                    left: PFspace.screenMargin,
                    child: tagImage(
                      context: context,
                      width: imageW,
                      height: imageH,
                      url: _focusData3[index].imgUrl,
                      tag: _focusData3[index].category,
                    ),
                  ),
                  // 课程标题
                  positioningText(
                    context: context,
                    top: PFspace.ruleM,
                    left: textL,
                    height: _focusData3[index].title.length > 11 ? 60.h : 28.h,
                    width: pieceW - textL - PFspace.screenMargin,
                    text: _focusData3[index].title,
                    font: 'MyFontStyle',
                    fontSize: 31.sp,
                  ),
                  //直播时间
                  positioningText(
                    context: context,
                    top: 130.0.h,
                    left: textL,
                    height: 100.h,
                    width: 168.w,
                    text: time,
                    font: '',
                    fontSize: 28.sp,
                  ),
                  //主讲人
                  positioningText(
                    context: context,
                    top: 80.0.h,
                    left: textL,
                    height: 100.h,
                    width: 168.w,
                    text: _focusData3[index].author,
                    font: '',
                    fontSize: 26.sp,
                  ),
                  //主讲人标签
                  positioningText(
                    context: context,
                    top: 80.0.h,
                    left: textL + 100.w,
                    height: 100.h,
                    width: 168.w,
                    text: _focusData3[index].authorTags,
                    font: '',
                    fontSize: 26.sp,
                  ),
                  //预约按钮
                  Positioned(
                    bottom: PFspace.ruleM,
                    right: PFspace.screenMargin,
                    child: SizedBox(
                      width: 130.w,
                      height: 50.w,
                      child: ElevatedButton(
                        child: status == "0"
                            ? const Text("预约")
                            : const Text("已预约"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              status == "0"
                                  ? Colors.green
                                  : Colors.grey), //背景颜色
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white), //字体颜色
                          overlayColor: MaterialStateProperty.all(
                              const Color(0xffFFF8E5)), // 高亮色
                          shadowColor: MaterialStateProperty.all(
                              const Color(0xffffffff)), //阴影颜色
                          elevation: MaterialStateProperty.all(0), //阴影值
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontSize: 13,
                              fontFamily: 'MyFontStyle',
                            ),
                          ), //字体
                          shape: MaterialStateProperty.all(StadiumBorder(
                              side: BorderSide(
                            //设置 界面效果
                            style: BorderStyle.solid,
                            color: status == "0" ? Colors.green : Colors.grey,
                          ))),
                          //圆角弧度
                          fixedSize:
                              MaterialStateProperty.all(const Size(5, 0)),
                        ),
                        onPressed: () {
                          if (status == "0") {
                            //执行日历预约方法
                            createEvent(calendars);
                            //执行预约方法
                            setState(() {
                              _handleRecordAdd(index);
                              status = "1";
                              _handleCourse();
                            });
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LiveDetail(product: _focusData3[index]),
                            ),
                          ).then((value) => _getInitial());
                        },
                      ),
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
    );
  }

  // 最新资讯
  Container buildInfomation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      height: 237,
      width: 345,
      // color: Colors.white,
      child: buildInfomationContext(),
    );
  }

  ListView buildInfomationContext() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        if (_focusData2.isNotEmpty) {
          return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到资讯详情');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        InforDetails(product: _focusData2[index]),
                  ),
                );
              },
              child: Container(
                height: 200.h,
                width: 345.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //border: Border.all(color: Colors.black54),
                ),
                child: Stack(
                  children: <Widget>[
                    //资讯封面
                    positionedImage(
                      context: context,
                      top: 10,
                      left: 10,
                      height: 100,
                      width: 100,
                      url: _focusData2[index].img,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    // 资讯标题
                    positioningText(
                      context: context,
                      top: 30.h,
                      left: 230.w,
                      height: 90.h,
                      width: 500.w,
                      text: _focusData2[index].title,
                    ),
                  ],
                ),
              ) // ),
              );
        } else {
          return const Loading();
        }
      },
    );
  }

//精彩课程
  Container _buildCourse() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      height: 400.h,
      width: 345,
      child: buildCourseContext(),
    );
  }

  ListView buildCourseContext() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        var _imageHeight = _coursesW * PFr.silver414 - PFspace.screenMargin * 2;
        var _imageWidht = _imageHeight * PFr.ratio3_4;
        if (_focusData4.isNotEmpty) {
          return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到课程详情');
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CourseIndexPage(product: _focusData4[index])));
              },
              child: Container(
                height: 180.h,
                width: 345.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //border: Border.all(color: Colors.black54),
                ),
                child: Stack(
                  children: <Widget>[
                    // 课程封面
                    positionedImage(
                      context: context,
                      top: 15.h,
                      left: PFspace.screenMargin,
                      height: 150.h,
                      width: 180.w,
                      url: _focusData4[index].imgUrl,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    // 课程标题
                    positioningText(
                      context: context,
                      top: 15.h,
                      left: 250.w,
                      height:
                          _focusData4[index].title.length > 11 ? 60.h : 25.h,
                      width: 380.w,
                      text: _focusData4[index].title,
                      font: 'MyFontStyle',
                      fontSize: 31.sp,
                    ),
                    // 作者
                    positioningText(
                      context: context,
                      top: 130.h,
                      left: 260.w,
                      height: 30.h,
                      width: 180.w,
                      text: _focusData4[index].author,
                      font: '',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      color: PFc.textSecondary,
                    ),
                    // 作者标签
                    positioningText(
                      context: context,
                      top: 70.h,
                      left: PFspace.screenMargin +
                          _imageWidht +
                          PFspace.screenMargin +
                          95.w,
                      height: 30.h,
                      width: 295.w,
                      text: _focusData4[index].authorTags,
                      font: '',
                      fontSize: 25.sp,
                      maxLines: 1,
                      color: PFc.textSecondary,
                    ),
                  ],
                ),
              ) // ),
              );
        } else {
          return const Loading();
        }
      },
    );
  }
}
