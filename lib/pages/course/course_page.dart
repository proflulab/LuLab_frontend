import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/global/global.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '../other/loading.dart';
import 'course_index.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late QueryCourseClassification _classification;
  List<QueryCourseClassificationElement> _focusData2 = [];

  late LatestDirectCourse _latestDirectCourse;
  List<LatestDirectCourseElement> _focusData3 = [];
  String _mode = "3";
  int _selectIndex = 0;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectW = 1.sw * (1 - PFr.silver) - 12.w;
  final double _coursesW = 1.sw * PFr.silver - PFspace.screenMargin;

  @override
  void initState() {
    super.initState();
    _handleCourse();
    _loadClassificationData();
  }

  //获取课程分类
  _loadClassificationData() async {
    _classification = await GqlCourseClassificationAPI.indexPageInfo(
        schema: '', context: context);
    var focusList = _classification.queryCourseClassification;

    setState(() {
      _focusData2 = focusList;
      //print(_focusData2);
    });
  }

  //获取主课程信息
  _handleCourse() async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: _mode,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //由主题统一配色，不在这里重新设定颜色
        backgroundColor: PFc.backgroundPrimary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '课程',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: PFc.textEmphasis,
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
        decoration: const BoxDecoration(color: PFc.backgroundSecondary),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: _selectW,
              child: Column(
                children: [
                  SizedBox(
                    height: _focusData2.length * _selectW * PFr.golden,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _focusData2.length + 1,
                      itemBuilder: (context, index) {
                        if (_focusData2.isNotEmpty) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (kDebugMode) {
                                  print('点击了' + _focusData2[index].title);
                                  print('点击了' + _focusData2[index].mode);
                                }
                                _selectIndex = index;
                                _mode = _focusData2[index].mode;
                                _handleCourse();
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: _selectW * 0.05,
                                  height: _selectW * PFr.golden - 30.h,
                                  decoration: BoxDecoration(
                                    color: _selectIndex == index
                                        ? PFc.themeColor
                                        : PFc.backgroundPrimary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                  ),
                                ),
                                Container(
                                  width: _selectW * 0.95,
                                  height: _selectW * PFr.golden,
                                  decoration: BoxDecoration(
                                      color: _selectIndex == index
                                          ? PFc.backgroundSecondary
                                          : PFc.backgroundPrimary,
                                      borderRadius: _selectIndex == index
                                          ? null
                                          : _selectIndex == index + 1
                                              ? const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )
                                              : _selectIndex == index - 1
                                                  ? const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10))
                                                  : null),
                                  child: Center(
                                    child: Text(
                                      _focusData2[index].title,
                                      style: _selectIndex == index
                                          ? TextStyle(
                                              fontFamily: 'MyFontStyle',
                                              color: PFc.textPrimary,
                                              fontSize: PFfont.s36,
                                            )
                                          : TextStyle(
                                              color: PFc.textSecondary,
                                              fontSize: PFfont.s30,
                                            ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Loading();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: _selectW * PFr.golden,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: _selectW * PFr.golden,
                          decoration: BoxDecoration(
                              color: PFc.backgroundPrimary,
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
                      color: PFc.backgroundPrimary,
                      width: _selectW,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                child: Container(
              decoration: const BoxDecoration(color: PFc.backgroundSecondary),
              padding: EdgeInsets.only(left: 12.w, right: 16.w),
              child: ListView.builder(
                itemCount: _focusData3.length,
                itemBuilder: (context, index) {
                  var _imageHeight = _coursesW * 0.414 - 16.w * 2;
                  var _imageWidht = _imageHeight * PFr.ratio3_4;
                  var _textWidht = _coursesW - (16.w + _imageWidht + 16.w);
                  if (_focusData3.isNotEmpty) {
                    return InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseIndexPage(
                              product: _focusData3[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: _coursesW * 0.414,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
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
                              url: _focusData3[index].imgUrl,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            // 课程标题
                            positioningText(
                              context: context,
                              top: 15.h,
                              left: (16.w + _imageWidht + 16.w) - 3.w,
                              height: _focusData3[index].title.length > 11
                                  ? 60.h
                                  : 25.h,
                              width: _textWidht,
                              text: _focusData3[index].title,
                              font: 'MyFontStyle',
                              fontSize: 31.sp,
                            ),
                            // 作者
                            positioningText(
                              context: context,
                              top: _focusData3[index].title.length > 11
                                  ? 85.h
                                  : 50.h,
                              left: 16.w + _imageWidht + 16.w,
                              height: 30.h,
                              width: 80.w,
                              text: _focusData3[index].author,
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
                              top: _focusData3[index].title.length > 11
                                  ? 85.h
                                  : 50.h,
                              left: 16.w + _imageWidht + 16.w + 95.w,
                              height: 30.h,
                              width: _textWidht - 95.w,
                              text: _focusData3[index].authorTags,
                              font: '',
                              fontSize: 25.sp,
                              maxLines: 1,
                              color: PFc.textSecondary,
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
            ))
          ],
        ),
      ),
    );
  }
}
