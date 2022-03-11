import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

import 'course_index.dart';

class CourseCatalogue extends StatefulWidget {
  const CourseCatalogue({Key? key}) : super(key: key);

  @override
  _CourseCatalogueState createState() => _CourseCatalogueState();
}

class _CourseCatalogueState extends State<CourseCatalogue> {
  late PostsData _postsData;
  List _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
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

  @override
  Widget build(BuildContext context) {
    return buildCatalog(focusData: _focusData);
  }

  Column buildCatalog({required List focusData}) {
    return Column(
      children: [
        const Divider(
          color: Color(0xffe4e4e4),
        ),
        const Text(
          '课程目录',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'MyFontStyle',
              fontSize: 28,
              fontWeight: FontWeight.w500),
        ),
        const Divider(
          color: Color(0xffe4e4e4),
        ),
        SizedBox(
          height: 700.h,
          child:
              // ListView.builder(
              //   itemCount: 30,
              //   itemBuilder: (BuildContext context, int index) => ListTile(
              //     title: Text('第${index + 1}节：大公司被颠覆的底层原因\n25分钟'),
              //   ),
              // ),
              ListView.builder(
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
                    height: 150.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      //border: Border.all(color: Colors.black54),
                    ),
                    margin: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        // 课程封面
                        positionedImage(
                            context: context,
                            top: 10,
                            left: 10,
                            height: 160,
                            width: 160,
                            url:
                                'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg'),
                        // 课程标题
                        positioningText(
                            context: context,
                            top: 30,
                            left: 190,
                            height: 40,
                            width: 200,
                            text: _focusData[index].title),
                        // 作者
                        positioningText(
                            context: context,
                            top: 55,
                            left: 190,
                            height: 40,
                            width: 200,
                            text: _focusData[index].author),
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
              } else {
                return const Text('加载中...');
              }
            },
          ),
        ),
      ],
    );
  }
}
