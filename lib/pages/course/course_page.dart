import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
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

  int _selectIndex = 0;

  final double _selectColumnsWidth = 0.245333333333333333.sw;
  final List _courseid = ['理论课程', '大咖访谈', '举例1', '举例2', '举例3', '举例4'];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await MainCourseAPI.maincourse(schema: '', context: context);
    var focusList = _postsData.data.latestMainCourse;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //由主题统一配色，不在这里重新设定颜色
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '课程',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.green,
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
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: <Widget>[
            SizedBox(
                width: _selectColumnsWidth,
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: _courseid.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (kDebugMode) {
                                  print(DateTime.now());
                                  print("点击了课程目录");
                                  // print(DateTime.now().millisecondsSinceEpoch);
                                  // print(DateTime.fromMillisecondsSinceEpoch(
                                  //     DateTime.now().millisecondsSinceEpoch));
                                }
                                _selectIndex = index;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: _selectColumnsWidth * 0.618,
                              decoration: BoxDecoration(
                                  color: _selectIndex == index
                                      ? Colors.white
                                      : const Color.fromRGBO(246, 246, 246, 1),
                                  borderRadius: _selectIndex == index
                                      ? const BorderRadius.only()
                                      : _selectIndex == index + 1
                                          ? const BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            )
                                          : _selectIndex == index - 1
                                              ? const BorderRadius.only(
                                                  topRight: Radius.circular(10))
                                              : const BorderRadius.only()),
                              child: Center(
                                child: Text(_courseid[index],
                                    style: _selectIndex == index
                                        ? const TextStyle(
                                            fontFamily: 'MyFontStyle',
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontSize: 20,
                                          )
                                        : const TextStyle(
                                            color: Color.fromRGBO(
                                                136, 136, 136, 1),
                                            fontSize: 18,
                                          ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      width: _selectColumnsWidth,
                      height: 1.sh -
                          (_selectColumnsWidth * 0.618 * _courseid.length +
                              220.h),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.only(left: 10, right: 12),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _focusData.length,
                    itemBuilder: (context, index) {
                      if (_focusData.isNotEmpty) {
                        return InkWell(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseIndexPage(
                                        product: _focusData[index])));
                          },
                          child: Container(
                            height: 170.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              //border: Border.all(color: Colors.black54),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Stack(
                              children: <Widget>[
                                // 课程封面
                                positionedImage(
                                    context: context,
                                    top: 10,
                                    left: 10,
                                    height: 150,
                                    width: 160,
                                    url: _focusData[index].imgUrl),
                                // 课程标题
                                positionedText(
                                    context: context,
                                    top: 30,
                                    left: 190,
                                    height: 80.h,
                                    width: 700.w,
                                    text: _focusData[index].title),
                                // 作者
                                positionedText(
                                    context: context,
                                    top: 55,
                                    left: 190,
                                    height: 80.h,
                                    width: 700.w,
                                    text: _focusData[index].author),
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
