import 'package:flutter/material.dart';

import '../../values/screenAdapter.dart';

import '../../api/apis.dart';
import '../../entitys/CourseData.dart';

//import 'package:get/get.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late PostsData _postsData;
  List _focusData = [];

  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
    var focusList = _postsData.latestCourse;

    setState(() {
      this._focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._focusData.length > 0) {
      return Scaffold(
        appBar: AppBar(
          //由主题统一配色，不在这里重新设定颜色
          //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          title: InkWell(
            //onTap是点击事件回调
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },

            child: Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  //改变搜索外框颜色
                  //border: Border.all(color: Colors.black),
                  color: Color.fromRGBO(230, 230, 230, 0.8),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(children: <Widget>[
                Icon(
                  Icons.search,
                  color: (Color.fromRGBO(89, 89, 89, 1)),
                ),
                Text(
                  "   开始搜索",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontSize: 15,
                  ),
                )
              ]),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.download_for_offline_outlined,
                color: Color.fromRGBO(117, 117, 117, 1)),
            //如果没有onPressed会报错
            onPressed: () {
              print("跳转到下载记录");
              Navigator.pushNamed(context, '/download');
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print("跳转到观看历史");
                  Navigator.pushNamed(context, '/history');
                },
                icon: Icon(
                  Icons.history,
                  color: Color.fromRGBO(117, 117, 117, 1),
                ))
          ],
        ),
        body: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: double.infinity,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            print("点击了课程目录");
                            _selectIndex = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          //child: Text("$index4", textAlign: TextAlign.center),
                          child: Text("推荐", textAlign: TextAlign.center),
                          color: _selectIndex == index
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ),
                      Divider(
                        //是控件的高，并不是线的高度，绘制的线居中
                        height: 5,
                        //线的高度
                        //thickness: 5,
                        //color: Colors.red,
                        //分割线前面空白区域
                        //indent: 10,
                        //分割线后面空白区域。
                        endIndent: 10,
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 12),
                  child: ListView.builder(
                    itemCount: _focusData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          print('到课程详情');
                          // var result = await Get.toNamed("/home/course",
                          //     arguments: _focusData[index]);
                          // Get.snackbar("返回值",
                          //     "success -> " + result["success"].toString());
                          //Navigator.of(context).pushReplacementNamed('/course');
                          //Navigator.pushNamed(context, '/course');
                        },
                        child: Container(
                          height: ScreenAdapter.height(170),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            //border: Border.all(color: Colors.black54),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Stack(
                            children: <Widget>[
                              // 课程封面
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg',
                                    ),
                                  ),
                                ),
                              ),
                              // 课程标题
                              Positioned(
                                top: 10,
                                left: 130,
                                child: Container(
                                  height: 20,
                                  child: Text(
                                    _focusData[index].title,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              // 作者
                              Positioned(
                                top: 35,
                                left: 130,
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  child: Text(
                                    _focusData[index].author,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              // 课程学习进度
                              // Positioned(
                              //   top: 80,
                              //   left: 130,
                              //   child: Container(
                              //     height: 20,
                              //     width: 80,
                              //     decoration: BoxDecoration(
                              //       color: Colors.grey,
                              //     ),
                              //     child: Text(
                              //       '已学2节/共5节',
                              //       style: TextStyle(
                              //         fontSize: 12,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      );
    } else {
      return Text('加载中...');
    }
  }
}
