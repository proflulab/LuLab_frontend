import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/common/api/gql_latestdetailcourse.dart';
import 'package:proflu/common/entitys/detail_coursedata.dart';
import 'package:proflu/common/widget/positioned_widget.dart';
import 'package:proflu/pages/course/course_index2.dart';

import '../../common/utils/utils.dart';

/// 底部弹起的课程详情

class CourseDetail extends StatefulWidget {
  final product;
  const CourseDetail({Key? key, required this.product}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late DetailCourse _detailCourse;
  List _focusData = [];

  @override
  void initState() {
    super.initState();
    _handleCourse();
  }

  // 读取所有课程数据
  _handleCourse() async {
    CourseRequest variables = CourseRequest(
      dirId: widget.product._id,
      courseId: widget.product.firstCourseId,
    );
    _detailCourse = await GqlDetailCourseAPI.indexPageInfo(
        variables: variables, context: context);
    var focusList = _detailCourse.detailCourse.subCourses;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildCourseDetail();
  }

//课程简介
  ListView buildCourseDetail() {
    return ListView(
      children: [
        const Divider(
          color: Color(0xffe4e4e4),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '课程名称:' + widget.product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'MyFontStyle',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            '作者：' + widget.product.author,
            style: const TextStyle(
                fontFamily: 'MyFontStyle',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            widget.product.authorTags,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Text(
            widget.product.classTags,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '颠覆式创新',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '公司',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                '课程介绍',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Wrap(
            children: [Text(widget.product.description)],
          ),
        ),
        const Text(
          '课程目录',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'MyFontStyle',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 800.h,
          width: 500.w,
          child: ListView.builder(
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
                            builder: (context) => CourseIndexPageTwo(
                                product: _focusData[index])));
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
                        // 课程标题
                        positionedText(
                            context: context,
                            top: 30,
                            left: 190,
                            height: 40,
                            width: 200,
                            text: _focusData[index].subTitle),
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
