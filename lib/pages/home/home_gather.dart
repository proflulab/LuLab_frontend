import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:proflu/pages/course/course_index.dart';
import 'package:proflu/pages/source/infor_details.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

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

  @override
  void initState() {
    super.initState();
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

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
    var focusList = _postsData.latestCourse;
    // var focusId = _postsData.latestCourse[1].id;

    setState(() {
      _focusData = focusList;
    });
  }

  //轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "assets/images/liuqiangdong.jpg"},
      {"url": "assets/images/Rectangle 6.png"},
      {"url": "assets/images/Rectangle 5.png"},
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
      decoration: BoxDecoration(
        //设置四周圆角 角度
        borderRadius: Radii.k15pxRadius,
      ),
      child: AspectRatio(
        aspectRatio: 9 / 5,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              imgList[index]["url"],
              fit: BoxFit.fill,
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
        borderRadius: Radii.k6pxRadius,
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
        _titleWidget("最新咨询"),
        buildInfomation(),
        // buildFreeCourse(),
        _titleWidget("精选课程"),
        _buildCourse(),
        // buildWonderCourse(),
      ],
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
        borderRadius: Radii.k6pxRadius,
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
                          borderRadius: Radii.k6pxRadius,
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
          return const Text('加载中...');
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
        borderRadius: Radii.k6pxRadius,
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
                          borderRadius: Radii.k15pxRadius,
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
          return const Text('加载中...');
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
