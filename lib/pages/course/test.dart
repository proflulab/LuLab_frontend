import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import '../../common/api/gql_course.dart';
import '../../common/entitys/data_course.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({Key ?key}) : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // 当前页数
  int  _page = 0;
  //第一次请求获取课程个数
  final int _limit = 5;
  // // 页面数据
  // final List _list = [];
  // 是否还有
  bool _hasMore = true;
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  late QueryCourse _queryCourse;
  List<Course> _focusData2 = [];
  //第一次课程list请求的id
  String _categoryId = "63c4d7e691dc5226f0a9fe83";
  @override
  void initState() {
    super.initState();
    _getData();
    // 监听滚动事件
    _scrollController.addListener((){
      // 获取滚动条下拉的距离
      // print(_scrollController.position.pixels);
      // 获取整个页面的高度
      // print(_scrollController.position.maxScrollExtent);
      if(_scrollController.position.pixels>_scrollController.position.maxScrollExtent-40){
        _getData();
      }
    });
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
          // if (_page > 0) {
          //   _focusData2.addAll(_queryCourse.course);
          // } else {
          //   _focusData2 = _queryCourse.course;
          // }
          _focusData2 = _queryCourse.course;
          print(_focusData2);
        },
      );
    }
  }
  // 获取数据列表
  void _getData() async{
    if(_hasMore){
      setState(() {
        // 页数累加
        _page = _page + 1;
        _loadCourse(_limit, _page);
      });
      int _allCount = _page * _limit;
      if(_allCount > _focusData2.length){
        setState(() {
          // 关闭加载
          _hasMore = false;
        });
      }
    }
  }

  // 下拉刷新
  Future<void> _onRefresh() async{
    if (kDebugMode) {
      print("下拉刷新");
    }
    // 持续两秒
    await Future.delayed(const Duration(milliseconds:2000),(){
      _getData();
    });
  }


  // 加载动画
  Widget _getMoreWidget() {

    // 如果还有数据
    if(_hasMore){
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                '加载中',
                style: TextStyle(fontSize: 16.0),
              ),
              // 加载图标
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    }else{
      return const Center(
        child: Text("...我是有底线的..."),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title:const Text("新闻列表")
          ),
          body:_focusData2.isEmpty?_getMoreWidget():RefreshIndicator(
              onRefresh:_onRefresh,
              child: ListView.builder(
                // 上拉加载控制器
                controller: _scrollController,
                itemCount: _focusData2.length,
                itemBuilder: (context,index){

                  Widget tip = Text("");
                  // 当渲染到最后一条数据时，加载动画提示
                  if(index == _focusData2.length-1){
                    tip = _getMoreWidget();
                  }
                  return Column(
                    children: <Widget>[
                      ListTile(
                          title:Text(
                            "${_focusData2[index].title}",
                            maxLines:1,
                          )
                      ),
                      Divider(),
                      // 加载提示
                      tip
                    ],
                  );
                },
              )
          )
      ),
    );
  }
}