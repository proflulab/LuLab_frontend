//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh_strong/easy_refresh.dart';

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
  List<CourseCategory> _categoryData = [];

  late QueryCourse _queryCourse;
  List<Course> _courseData = [];

  //第一次课程list请求的id
  String _categoryId = "6402f65fff361fe1b9006d87";

  //监控选择的分类
  int _selectIndex = 0;

  late EasyRefreshController _controllerCourse;

  //每页课程个数
  final int _limit = 6;

  //刷新请求获取第几页
  int _page = 1;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectW = PFspace.screenW * (1 - PFr.silver) - 12.w;
  final double _coursesW = PFspace.screenW * PFr.silver - PFspace.screenMargin;

  @override
  void initState() {
    super.initState();
    _loadCourseCategory();
    _controllerCourse = EasyRefreshController();
  }

  //获取课程分类列表
  _loadCourseCategory() async {
    _queryCourseCategory = await GqlCourseAPI.courseCategory(context: context);

    if (mounted) {
      setState(() {
        _categoryData = _queryCourseCategory.courseCategory;
        _categoryId = _categoryData[0].id;
        print(_categoryId);
        _loadCourse(_categoryId, _limit, _page);
      });
    }
  }

  ///获取主课列表信息
  /// [_id]为课程id
  /// [page] 为请求的页面，如[page]为2，则说明请求第二页的数据
  /// [limit]限制每次请求页数的数量
  _loadCourse(String _id, int limit, int page) async {
    CourseRequest variables = CourseRequest(
      categoryId: _id,
      limit: limit,
      page: page,
    );
    _queryCourse =
        await GqlCourseAPI.course(variables: variables, context: context);

    if (mounted) {
      setState(
        () {
          page == 1
              ? _courseData = _queryCourse.course
              : _courseData.addAll(_queryCourse.course);
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
            height: _categoryData.length * _selectW * PFr.golden,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categoryData.length,
              itemBuilder: (context, index) {
                if (_categoryData.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectIndex = index;
                        _categoryId = _categoryData[index].id;
                        _page = 1;
                        _courseData = [];
                        _controllerCourse.finishLoad(success: false);
                        _loadCourse(_categoryId, _limit, _page);
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
                              _categoryData[index].title,
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
                    borderRadius: _selectIndex == _categoryData.length - 1
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
        _courseData = [];
        _page = 1;
        _loadCourse(_categoryId, _limit, _page);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              _controllerCourse.resetLoadState();
            }
          },
        );
      },
      onLoad: () async {
        _loadCourse(_categoryId, _limit, _page + 1);
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              setState(() {
                _page += 1;
              });
              int _allCount = _page * _limit;
              _controllerCourse.finishLoad(
                  noMore: _allCount > _courseData.length);
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
              if (_courseData.isNotEmpty) {
                return InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseIndexPage(
                          product: _courseData[index],
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
                                _courseData[index].imageUrl),
                          ),
                        ),
                        SizedBox(width: PFspace.ruleS),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PFtext.text1(
                                text: _courseData[index].title,
                                fontSize: PFfont.s36,
                              ),
                              SizedBox(height: 20.h),
                              PFtext.text4(
                                text: _courseData[index].description,
                                fontSize: PFfont.c24,
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
            childCount: _courseData.length,
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
