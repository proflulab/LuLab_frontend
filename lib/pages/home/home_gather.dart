import 'package:alarm_calendar/alarm_calendar.dart';
import 'package:alarm_calendar/calendars.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../common/widget/toast.dart';
import '../../common/global/global.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

import '../../pages/course/course_index.dart';
import '../../pages/source/infor_details.dart';
import '../other/loading.dart';
import 'live_detail.dart';

class Gather extends StatefulWidget {
  const Gather({Key? key}) : super(key: key);

  @override
  _GatherState createState() => _GatherState();
}

class _GatherState extends State<Gather> {
  late PostsData _postsData;
  List _focusData = [];
  late Inforponse _postsIfoData;
  List _focusData2 = [];
  late LatestDirectCourse _latestDirectCourse;
  List _focusData3 = [];
  late RecordAdd _recordAdd;
  var _recordData;
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
    _loadAllData();
  }

  // 读取咨询所有数据
  _loadIfoData() async {
    _postsIfoData = await SourseAPI.userup(context: context, schema: '');
    var focusList = _postsIfoData.latestInformation;

    setState(() {
      _focusData2 = focusList;
    });
  }

  //添加预约
  _handleRecordAdd(int index) async {
    RecordAddRequest variables = RecordAddRequest(
      authorId: Global.profile.data.id,
      status: "1",
      courseId: _focusData3[index].id,
      onlineTime: now,
    );
    _recordAdd = await GqlRecordAddAPI.indexPageInfo(
        variables: variables, context: context);
    var recordData = _recordAdd.recordAdd;
    toastInfo(msg: '预约成功');
    setState(() {
      _recordData = recordData;
    });
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
    var focusList = _postsData.latestCourse;
    // var focusId = _postsData.latestCourse[1].id;

    setState(() {
      _focusData = focusList;
    });
  }

  // 读取直播课程数据
  _handleCourse() async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: "2",
      authorId: Global.profile.data.id,
      limit: 10,
      skip: 0,
    );
    _latestDirectCourse = await GqlLatestDirectCourseAPI.indexPageInfo(
        variables: variables, context: context);
    setState(() {
      _focusData3 = _latestDirectCourse.latestDirectCourse;
    });
  }

  Future<void> createEvent(Calendars calendars) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then((res) async {
      if (res != null) {
        //查询是否有写权限
        await AlarmCalendar.CheckWritePermission().then((resWrite) async {
          if (resWrite != null) {
            final id = await AlarmCalendar.createEvent(calendars);
            calendars.setEventId = id!;
            if (kDebugMode) {
              print('获得ID为：' + id);
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        // SizedBox(height: fitHeight(20)),
        // _titleWidget("课程预约"),
        // SizedBox(height: fitHeight(20)),
        // _hotProductListWidget(),
        // SizedBox(height: fitHeight(20)),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _titleWidget("直播预约"),
        _focusData3.isEmpty ? const SizedBox(height: 0) : _buildLive(),
        _titleWidget("最新咨询"),
        buildInfomation(),
        // buildFreeCourse(),
        _titleWidget("精选课程"),
        _buildCourse(),
        // buildWonderCourse(),
      ],
    );
  }

  //轮播图
  Widget _swiperWidget() {
    List imgList = [
      "https://gitee.com/shimingy/imagesbed/raw/master/img/%E8%BD%AE%E6%92%AD%E5%9B%BE1.png",
      "https://gitee.com/shimingy/imagesbed/raw/master/img/%E8%BD%AE%E6%92%AD%E5%9B%BE2.png",
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
      child: AspectRatio(
        aspectRatio: 9 / 5,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // 用Container实现图片圆角的效果
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgList[index]), // 图片数组
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            );
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
          activeColor: Colors.green),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: PFRadius.a6,
      ),
      height: 60.h,
      width: 100,
      // color: Colors.white,
      child: Stack(children: [
        Positioned(
          top: 8.0,
          left: 20.0,
          child: SizedBox(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'MyFontStyle',
                fontSize: 24,
              ),
            ),
          ),
        ),
      ]),
    );
  }
//课程预约
  // Widget _hotProductListWidget() {
  //   return Container(
  //     height: 100.0,
  //     width: 400.0,
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //     ),
  //     child: ListTile(
  //       leading: Image.network(
  //           'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
  //       title: const Text('案例课直播  学理论不如学案例'),
  //       subtitle: const Text('介绍：'),
  //       trailing: TextButton(
  //         autofocus: true,
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(Colors.blue),
  //             shape: MaterialStateProperty.all(const StadiumBorder())),
  //         child: const Text(
  //           "预约",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         onPressed: () {},
  //       ),
  //     ),
  //   );
  // }

  //推荐

  // 直播预约
  Container _buildLive() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: PFRadius.a6,
      ),
      height: 118.5 * _focusData3.length,
      width: 345,
      // color: Colors.white,
      child: buildLiveContext(),
    );
  }

  ListView buildLiveContext() {
    return ListView.builder(
      itemCount: _focusData3.length,
      itemBuilder: (context, index) {
        var now2 = _focusData3[index].onlineTime;
        var future = DateTime.fromMillisecondsSinceEpoch(now2);
        var futureYear = int.parse(formatDate(future, [yyyy]));
        var futureMounth = int.parse(formatDate(future, [mm]));
        var futureDay = int.parse(formatDate(future, [dd]));
        var futureHour = int.parse(formatDate(future, [HH]));
        var futureMinute = int.parse(formatDate(future, [nn]));
        var status = _focusData3[index].status;
        Calendars calendars = Calendars(
          DateTime(
              futureYear, futureMounth, futureDay, futureHour, futureMinute),
          DateTime(
                  futureYear, futureMounth, futureDay, futureHour, futureMinute)
              .add(Duration(minutes: _focusData3[index].duration)),
          _focusData3[index].title,
          _focusData3[index].description,
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
                            builder: (context) =>
                                LiveDetail(product: _focusData3[index])))
                    .then((value) => _getInitial());
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
                    // 课程封面
                    Positioned(
                      top: 10.0,
                      left: 12.0,
                      child: Container(
                        height: 80,
                        width: 130,
                        decoration: BoxDecoration(
                          //设置四周圆角 角度
                          borderRadius: PFRadius.a6,
                        ),
                        child: Image.network(
                          _focusData3[index].imgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // 课程标题
                    Positioned(
                      top: 10.0,
                      left: 155.0,
                      child: SizedBox(
                        height: 100,
                        width: 168,
                        child: Text(
                          _focusData3[index].title,
                          style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 45.0,
                        left: 240.0,
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
                            textStyle:
                                MaterialStateProperty.all(const TextStyle(
                              fontSize: 15,
                              fontFamily: 'MyFontStyle',
                            )), //字体
                            shape: MaterialStateProperty.all(StadiumBorder(
                                side: BorderSide(
                              //设置 界面效果
                              style: BorderStyle.solid,
                              color: status == "0" ? Colors.green : Colors.grey,
                            ))), //圆角弧度
                          ),
                          onPressed: () {
                            //执行日历预约方法
                            createEvent(calendars);
                            //执行预约方法
                            setState(() {
                              _handleRecordAdd(index);
                              status = "1";
                              _handleCourse();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LiveDetail(product: _focusData3[index]),
                              ),
                            ).then((value) => _getInitial());
                          },
                        )
                        // : ElevatedButton(
                        //     child: const Text("已预约"),
                        //     style: ButtonStyle(
                        //       backgroundColor: MaterialStateProperty.all(
                        //           Colors.grey), //背景颜色
                        //       foregroundColor: MaterialStateProperty.all(
                        //           Colors.white), //字体颜色
                        //       overlayColor: MaterialStateProperty.all(
                        //           const Color(0xffFFF8E5)), // 高亮色
                        //       shadowColor: MaterialStateProperty.all(
                        //           const Color(0xffffffff)), //阴影颜色
                        //       elevation: MaterialStateProperty.all(0), //阴影值
                        //       textStyle:
                        //           MaterialStateProperty.all(const TextStyle(
                        //         fontSize: 15,
                        //         fontFamily: 'MyFontStyle',
                        //       )), //字体
                        //       shape: MaterialStateProperty.all(
                        //           BeveledRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.circular(5))), //圆角弧度
                        //     ),
                        //     onPressed: () {
                        //       //执行预约方法
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => LiveDetail(
                        //                   product: _focusData3[index])));
                        //     },
                        //   )
                        )
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

// 免费体验课程
  SingleChildScrollView buildFreeCourse() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
        ],
      ),
    );
  }

// 每个免费课程
  Container _buildEachFreeCourse() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            // 课程图片
            width: 100,
            height: 150,
            child: Image.asset('assets/images/logo.png'),
          ),
          const Text(
            'AI时代——造就...',
            style: TextStyle(color: Color(0xff404040)),
          ),
          const Text(
            '播放量130万',
            style: TextStyle(
              color: Color(0xffffcd92),
            ),
          ),
        ],
      ),
    );
  }

  // 最新咨询
  Container buildInfomation() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: PFRadius.a6,
      ),
      height: 237,
      width: 345,
      // color: Colors.white,
      child: buildInfomationContext(),
    );
  }

  ListView buildInfomationContext() {
    return ListView.builder(
      itemCount: _focusData2.length,
      itemBuilder: (context, index) {
        if (_focusData2.isNotEmpty) {
          return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到课程详情');
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InforDetails(product: _focusData2[index])));
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
                    // 课程封面
                    Positioned(
                      top: 10.0,
                      left: 12.0,
                      child: Container(
                        height: 80,
                        width: 130,
                        decoration: BoxDecoration(
                          //设置四周圆角 角度
                          borderRadius: PFRadius.a6,
                        ),
                        child: Image.asset(
                          'assets/images/liuqiangdong.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // 课程标题
                    Positioned(
                      top: 10.0,
                      left: 155.0,
                      child: SizedBox(
                        height: 100,
                        width: 168,
                        child: Text(
                          _focusData2[index].title,
                          style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            fontSize: 17,
                          ),
                        ),
                      ),
                    )
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
      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        color: Colors.white,
        borderRadius: PFRadius.a6,
      ),
      height: 400.h,
      width: 345,
      child: buildCourseContext(),
    );
  }

  ListView buildCourseContext() {
    return ListView.builder(
      itemCount: _focusData.length,
      itemBuilder: (context, index) {
        if (_focusData.isNotEmpty) {
          return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到课程详情');
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CourseIndexPage(product: _focusData[index])));
              },
              child: Container(
                height: 140.h,
                width: 345.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //border: Border.all(color: Colors.black54),
                ),
                child: Stack(
                  children: <Widget>[
                    // 课程封面
                    Positioned(
                      top: 10.0,
                      left: 12.0,
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          //设置四周圆角 角度
                          borderRadius: PFRadius.a15,
                        ),
                        child: Image.network(
                          'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // 课程标题
                    Positioned(
                      top: 10.0,
                      left: 145.0,
                      child: Text(
                        _focusData[index].title,
                        style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          fontSize: 21,
                        ),
                      ),
                    ),
                    // 作者
                    // positionedText(
                    //     context: context,
                    //     top: 55,
                    //     left: 190,
                    //     height: 40,
                    //     width: 200,
                    //     text: _focusData[index].author),
                    const Positioned(
                      top: 30.0,
                      left: 145.0,
                      child: SizedBox(
                          height: 36,
                          width: 188,
                          child: Text('介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey))),
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

// 精彩课程
  SingleChildScrollView buildWonderCourse() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildEachCourse(),
          buildEachCourse(),
          buildEachCourse(),
          buildEachCourse(),
        ],
      ),
    );
  }

// 每个课程
  Container buildEachCourse() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: Container(
          width: 100,
          child: Image.asset('assets/images/logo.png'),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffc3c3c3)),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        title: const Text("颠覆式创新"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text("陆向谦  实验室创始人"), Text("介绍。。。")],
        ),
      ),
    );
  }
}
