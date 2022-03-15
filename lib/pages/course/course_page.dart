import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/common/api/gql_courseclassification.dart';
import 'package:proflu/common/api/gql_latestdirectcourse.dart';
import 'package:proflu/common/entitys/course_classification_data.dart';
import 'package:proflu/common/entitys/latestdirectcourse_data.dart';
import 'package:proflu/common/global/global.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'course_index.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late MainCourseRequest _postsData;
  List _focusData = [];
  late QueryCourseClassification _classification;
  List _focusData2 = [];
  late LatestDirectCourse _latestDirectCourse;
  List _focusData3 = [];
  var mode = "1";
  int _selectIndex = 0;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectColumnsWidth = 1.sw * 0.293 - 12.w;
  final double _coursesDetailsWidth = 1.sw * (1 - 0.293) - 16.w;

  final List _courseList = ['理论课程', '大咖访谈', '往期课程', '精彩例会', '举例1', '举例2'];

  String a = "123";

  @override
  void initState() {
    super.initState();
    _loadAllData();
    _loadClassificationData();
    _handleCourse();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await MainCourseAPI.maincourse(schema: '', context: context);
    var focusList = _postsData.data.latestMainCourse;

    setState(() {
      _focusData = focusList;
    });
  }

  //读取课程分类
  _loadClassificationData() async {
    _classification = await GqlCourseClassificationAPI.indexPageInfo(
        schema: '', context: context);
    var focusList = _classification.queryCourseClassification;

    setState(() {
      _focusData2 = focusList;
    });
  }

  _handleCourse() async {
    LatestDirectCourseRequest variables =
        LatestDirectCourseRequest(mode: mode, authorId: Global.profile.data.id);
    _latestDirectCourse = await GqlLatestDirectCourseAPI.indexPageInfo(
        variables: variables, context: context);
    setState(() {
      _focusData3 = _latestDirectCourse.latestDirectCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //由主题统一配色，不在这里重新设定颜色
        backgroundColor: ProfluColors.primaryBackground,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '课程',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: ProfluColors.emphasisText,
            fontSize: 24,
          ),
        ),
        // title: InkWell(
        //   //onTap是点击事件回调
        //   onTap: () {
        //     Navigator.pushNamed(context, '/search');
        //   },
        //   child: Container(
        //     height: 30.0,
        //     padding: const EdgeInsets.only(left: 15),
        //     decoration: BoxDecoration(
        //         //改变搜索外框颜色
        //         //border: Border.all(color: Colors.black),
        //         color: const Color.fromRGBO(230, 230, 230, 0.8),
        //         borderRadius: BorderRadius.circular(15)),
        //     child: Row(children: const <Widget>[
        //       Icon(
        //         Icons.search,
        //         color: (Color.fromRGBO(89, 89, 89, 1)),
        //       ),
        //       Text(
        //         "开始搜索",
        //         //textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Color.fromRGBO(89, 89, 89, 1),
        //           fontSize: 15,
        //         ),
        //       )
        //     ]),
        //   ),
        // ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         if (kDebugMode) {
        //           print("跳转到观看历史");
        //         }
        //         Navigator.pushNamed(context, '/history');
        //       },
        //       icon: const Icon(
        //         Icons.history,
        //         color: Color.fromRGBO(117, 117, 117, 1),
        //       ))
        // ],
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: ProfluColors.secondaryBackground),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: _selectColumnsWidth,
              child: Column(
                children: [
                  SizedBox(
                    height: _focusData2.length * _selectColumnsWidth * 0.618,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _focusData2.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (kDebugMode) {
                                print('点击了' + _focusData2[index].title);
                                print('点击了' + _focusData2[index].mode);
                              }
                              _selectIndex = index;
                              mode = _focusData2[index].mode;
                              _handleCourse();
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: _selectColumnsWidth * 0.618,
                            decoration: BoxDecoration(
                                color: _selectIndex == index
                                    ? ProfluColors.secondaryBackground
                                    : ProfluColors.primaryBackground,
                                borderRadius: _selectIndex == index
                                    ? null
                                    : _selectIndex == index + 1
                                        ? const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                          )
                                        : _selectIndex == index - 1
                                            ? const BorderRadius.only(
                                                topRight: Radius.circular(10))
                                            : null),
                            child: Center(
                              child: Text(_focusData2[index].title,
                                  style: _selectIndex == index
                                      ? const TextStyle(
                                          fontFamily: 'MyFontStyle',
                                          color: ProfluColors.primaryText,
                                          fontSize: 18,
                                        )
                                      : const TextStyle(
                                          color: ProfluColors.secondaryText,
                                          fontSize: 16,
                                        ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: _selectColumnsWidth * 0.618,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: _selectColumnsWidth * 0.618,
                          decoration: BoxDecoration(
                              color: ProfluColors.primaryBackground,
                              borderRadius:
                                  _selectIndex == _focusData2.length - 1
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(10))
                                      : null),
                        );
                      },
                    ),
                  ),
                  Flexible(
                      child: Container(
                    color: ProfluColors.primaryBackground,
                    width: _selectColumnsWidth,
                  )),
                ],
              ),
            ),
            Flexible(
                child: Container(
              decoration:
                  const BoxDecoration(color: ProfluColors.secondaryBackground),
              padding: EdgeInsets.only(left: 12.w, right: 16.w),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _focusData3.length,
                itemBuilder: (context, index) {
                  var _imageHeight = _coursesDetailsWidth * 0.414 - 16.w * 2;
                  var _imageWidht =
                      (_coursesDetailsWidth * 0.414 - 16.w * 2) * 3 / 4;
                  var _textWidht =
                      _coursesDetailsWidth - (16.w + _imageWidht + 16.w);

                  if (_focusData3.isNotEmpty) {
                    return InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseIndexPage(
                                    product: _focusData3[index])));
                      },
                      child: Container(
                        height: _coursesDetailsWidth * 0.414,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Stack(
                          children: <Widget>[
                            // 课程封面
                            positionedImage(
                                context: context,
                                top: 15.h,
                                left: 16.w,
                                height: _imageHeight,
                                width: _imageWidht,
                                url: _focusData3[index].imgUrl),
                            // 课程标题
                            positioningText(
                                context: context,
                                top: 15.h,
                                left: 16.w + _imageWidht + 16.w,
                                height: _focusData3[index].title.length > 11
                                    ? 50.h
                                    : 25.h,
                                width: _textWidht,
                                text: _focusData3[index].title,
                                font: 'MyFontStyle'),
                            // 作者
                            positioningText(
                              context: context,
                              top: _focusData3[index].title.length > 11
                                  ? 75.h
                                  : 50.h,
                              left: 16.w + _imageWidht + 16.w,
                              height: 25.h,
                              width: 85.w,
                              text: _focusData3[index].author,
                              font: '',
                              fontWeight: FontWeight.bold,
                              fontSize: ProfluFonfSize.size14,
                              color: ProfluColors.secondaryText,
                            ),
                            // 作者标签
                            positioningText(
                              context: context,
                              top: _focusData3[index].title.length > 11
                                  ? 75.h
                                  : 50.h,
                              left: 16.w + _imageWidht + 16.w + 95.w,
                              height: 25.h,
                              width: _textWidht - 95.w,
                              text: "实验室创始人",
                              font: '',
                              fontSize: ProfluFonfSize.size14,
                              color: ProfluColors.secondaryText,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Text('加载中...');
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
