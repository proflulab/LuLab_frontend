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
  late QueryCourseCategory _queryCourseCategory;
  List<CourseCategory> _focusData = [];

  late QueryCourse _queryCourse;
  List<Course> _focusData2 = [];

  //第一次课程list请求的id
  String _categoryId = "63c4d7e691dc5226f0a9fe83";

  //监控选择的分类
  int _selectIndex = 0;

  late EasyRefreshController _controllerCourse;
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 是否还有
  bool _hasMore = true;

  //第一次请求获取课程个数
  final int _limit = 5;

  //刷新请求获取第几页
  int _page = 1;

  // //底部刷新请求个数
  // final int _countDown = 12;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectW = PFspace.screenW * (1 - PFr.silver) - 12.w;
  final double _coursesW = PFspace.screenW * PFr.silver - PFspace.screenMargin;

  @override
  void initState() {
    super.initState();
    _controllerCourse = EasyRefreshController();
    _loadCourse(_limit, _page);
    _loadCourseCategory();
  }

  //获取课程分类
  _loadCourseCategory() async {
    _queryCourseCategory = await GqlCourseAPI.courseCategory(context: context);

    if (mounted) {
      setState(() {
        _focusData = _queryCourseCategory.courseCategory;
        print(_focusData);
      });
    }
  }

  //获取主课程信息
  _loadCourse(int limit, int page) async {
    CourseRequest variables = CourseRequest(
      categoryId: _categoryId,
      limit: limit,
      page: page,
    );
    _queryCourse =
        await GqlCourseAPI.course(variables: variables, context: context);

    if (mounted) {
      setState(
        () {
          if (_page > 0) {
            _focusData2.addAll(_queryCourse.course);
          } else {
            _focusData2 = _queryCourse.course;
          }
          // _focusData2 = _queryCourse.course;
          // print(_focusData2);
        },
      );
    }
  }
  //
  // // 获取数据列表
  // void _getData() async{
  //   if(_hasMore){
  //     setState(() {
  //       // 页数累加
  //       _page = _page + 1;
  //       _loadCourse(_limit, _page);
  //     });
  //     int _allCount = _page * _limit;
  //     if(_allCount > _focusData2.length){
  //       setState(() {
  //         // 关闭加载
  //         _hasMore = false;
  //       });
  //     }
  //   }
  // }

  //左课程栏目
  Widget _select() {
    return SizedBox(
      width: _selectW,
      child: Column(
        children: [
          SizedBox(
            height: _focusData.length * _selectW * PFr.golden,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _focusData.length,
              itemBuilder: (context, index) {
                if (_focusData.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectIndex = index;
                        _categoryId = _focusData[index].id;
                        _page = 1;
                        _controllerCourse.finishLoad(success: false);
                        _loadCourse(_limit,_page);
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
                              _focusData[index].title,
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
                    borderRadius: _selectIndex == _focusData.length - 1
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
        _loadCourse(_limit,_page);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              // setState(() {
              //   _count = _countFirst;
              // });
              _controllerCourse.resetLoadState();
            }
          },
        );
      },
      onLoad: () async {
        _loadCourse(_limit,_page);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              setState(() {
                _page = _page + 1;
              });
              int _allCount = _page * _limit;
              _controllerCourse.finishLoad(
                  noMore: _allCount > _focusData2.length);
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
              if (_focusData2.isNotEmpty) {
                return InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseIndexPage(
                          product: _focusData2[index],
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
                            child: CachedImage.typeLaod(
                                _focusData2[index].imageUrl),
                          ),
                        ),
                        SizedBox(width: PFspace.ruleS),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PFtext.text1(
                                text: _focusData2[index].title,
                                fontSize: PFfont.s32,
                              ),
                              SizedBox(height: 8.h),
                              PFtext.text3(
                                text: _focusData2[index].description,
                                fontSize: PFfont.s36,
                              ),
                              // Row(
                              //   children: [
                              //     PFtext.text2(
                              //       text: _focusData2[index].author,
                              //       //.substring(0, 7),
                              //       color: PFc.textSecondary,
                              //     ),
                              //     const SizedBox(width: 10),
                              //     Flexible(
                              //       child: PFtext.text3(
                              //         text: _focusData2[index].authorTags,
                              //         color: PFc.textSecondary,
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
            childCount: _page > _focusData2.length ? _focusData2.length : _page,
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
