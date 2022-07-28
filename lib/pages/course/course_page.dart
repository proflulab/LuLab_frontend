//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:wakelock/wakelock.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'course_index.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage>
    with AutomaticKeepAliveClientMixin {
  late QueryCourseClassification _classification;
  List<QueryCourseClassificationElement> _focusData2 = [];

  late LatestDirectCourse _latestDirectCourse;
  List<LatestDirectCourseElement> _focusData3 = [];
  String _mode = "3";
  int _selectIndex = 0;

  late EasyRefreshController _controllerCourse;

  //第一次请求获取课程个数
  final int _countFirst = 12;

  //刷新请求获取课程个数
  int _count = 12;

  //底部刷新请求个数
  final int _countDown = 12;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectW = PFspace.screenW * (1 - PFr.silver) - 12.w;
  final double _coursesW = PFspace.screenW * PFr.silver - PFspace.screenMargin;

  @override
  void initState() {
    super.initState();
    _controllerCourse = EasyRefreshController();
    _handleCourse(0, _countFirst);
    _loadClassificationData();
  }

  //获取课程分类
  _loadClassificationData() async {
    _classification = await GqlCourseAPI.classIficationInfo(context: context);

    if (mounted) {
      setState(() {
        _focusData2 = _classification.queryCourseClassification;
      });
    }
  }

  //获取主课程信息
  _handleCourse(int skip, int limit) async {
    LatestDirectCourseRequest variables = LatestDirectCourseRequest(
      mode: _mode,
      authorId: Global.profile.id ?? "",
      skip: skip,
      limit: limit,
    );
    _latestDirectCourse = await GqlCourseAPI.sortCourseInfo(
        variables: variables, context: context);

    if (mounted) {
      setState(
        () {
          if (skip > 0) {
            _focusData3.addAll(_latestDirectCourse.latestDirectCourse);
          } else {
            _focusData3 = _latestDirectCourse.latestDirectCourse;
          }
        },
      );
    }
  }

  //左课程栏目
  Widget _select() {
    return SizedBox(
      width: _selectW,
      child: Column(
        children: [
          SizedBox(
            height: _focusData2.length * _selectW * PFr.golden,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _focusData2.length,
              itemBuilder: (context, index) {
                if (_focusData2.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectIndex = index;
                        _mode = _focusData2[index].mode;
                        _count = 12;
                        _controllerCourse.finishLoad(success: false);
                        _handleCourse(0, _countFirst);
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: _selectW * PFr.golden,
                          color: _selectIndex == index
                              ? PFc.backgroundSecondary
                              : PFc.backgroundPrimary,
                          child: Container(
                            width: _selectW * 0.05,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _selectIndex == index
                                  ? PFc.themeColor
                                  : PFc.backgroundPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                            ),
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
                                        bottomRight: Radius.circular(10),
                                      )
                                    : _selectIndex == index - 1
                                        ? const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                          )
                                        : null,
                          ),
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
                    borderRadius: _selectIndex == _focusData2.length - 1
                        ? const BorderRadius.only(
                            topRight: Radius.circular(10),
                          )
                        : null,
                  ),
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
    );
  }

  //右课程栏目
  Widget _courses() {
    return EasyRefresh.custom(
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      firstRefresh: true,
      firstRefreshWidget: const Loading(),
      controller: _controllerCourse,
      header: EasyrefreshWidget.getHeader(),
      footer: EasyrefreshWidget.getFooter(),
      onRefresh: () async {
        _handleCourse(0, _countFirst);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              setState(() {
                _count = _countFirst;
              });
              _controllerCourse.resetLoadState();
            }
          },
        );
      },
      onLoad: () async {
        _handleCourse(_count, _countDown);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              setState(() {
                _count += _countDown;
              });
              _controllerCourse.finishLoad(noMore: _count > _focusData3.length);
            }
          },
        );
      },
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var _imageHeight =
                  _coursesW * PFr.silver414 - 2 * PFspace.screenMargin;
              var _imageWidht = _imageHeight * PFr.ratio3_4;
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
                    padding: EdgeInsets.all(PFspace.screenMargin),
                    height: _coursesW * PFr.silver414,
                    decoration: const BoxDecoration(
                      //color: Color.fromARGB(255, 227, 39, 39),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _imageWidht,
                          height: _imageHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            child:
                                CachedImage.typeLaod(_focusData3[index].imgUrl),
                          ),
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
                                    //.substring(0, 7),
                                    color: PFc.textSecondary,
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: PFtext.text3(
                                      text: _focusData3[index].authorTags,
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
            childCount:
                _count > _focusData3.length ? _focusData3.length : _count,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBarCommon(
        context: context,
        title: '课程',
      ),
      //ToDo 搜索Appbar,等待后端接口
      // appBar: appBarSeach(
      //   context: context,
      //   icon: Icons.history,
      //   onTap: () {
      //     Navigator.pushNamed(context, '/search');
      //   },
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/history');
      //   },
      // ),
      body: Container(
        decoration: const BoxDecoration(color: PFc.backgroundSecondary),
        child: Row(
          children: <Widget>[
            _select(),
            Flexible(
              child: _courses(),
            ),
          ],
        ),
      ),
    );
  }
}
