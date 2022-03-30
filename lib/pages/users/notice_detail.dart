import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';

class NoticeDetail extends StatefulWidget {
  const NoticeDetail({Key? key, required this.product}) : super(key: key);
  final LatestRecordElement product;
  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  late DetailMainCourse _detailMainCourse;
  late DetailMainCourseClass _focusData;
  @override
  void initState() {
    super.initState();
    _handleDetail();
  }

  _handleDetail() async {
    DetailMainCourseRequest variables =
        DetailMainCourseRequest(courseId: widget.product.courseId);
    _detailMainCourse = await GqlCourseAPI.singleCourseInfo(
        variables: variables, context: context);
    setState(() {
      _focusData = _detailMainCourse.detailMainCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = (_focusData.description.length / 15) * 50.h;
    var time = DateTime.fromMillisecondsSinceEpoch(_focusData.onlineTime);
    String time1 = formatDate(time, [yyyy, '年', mm, '月', dd, '日']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _focusData.title,
          style: const TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.green,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        //centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            decoration: const BoxDecoration(
              //设置四周圆角 角度
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 150.h + height,
            width: 690.w,
            // color: Colors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      _focusData.title,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 70.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      "主讲人：" + _focusData.author,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ),
                Positioned(
                  top: 70.0.h,
                  left: 300.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      _focusData.authorTags,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 19),
                    ),
                  ),
                ),
                Positioned(
                  top: 110.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      time1,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ),
                Positioned(
                  top: 150.0.h,
                  left: 30.0.w,
                  child: SizedBox(
                    width: 634.0.w, //容器的相关参数
                    height: height,
                    child: Text(
                      _focusData.description,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
