import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/api/gql_course.dart';
import '../../common/entitys/data_course.dart';
import '../../common/widget/appbar.dart';

class CourseTest extends StatefulWidget {
  const CourseTest({Key? key}) : super(key: key);

  @override
  State<CourseTest> createState() => _CourseTestState();
}

class _CourseTestState extends State<CourseTest> {
  late QueryCourse _queryCourse;
  List<Course> _focusData2 = [];

  @override
  void initState() {
    super.initState();
    _loadCourse(1,10);
  }
  //获取主课程信息
  _loadCourse(int limit, int page) async {
    CourseRequest variables = CourseRequest(
      categoryId: "63c4d7e691dc5226f0a9fe83",
      limit: limit,
      page: page,
    );
    _queryCourse = await GqlCourseAPI.course(
        variables: variables, context: context);

    if (mounted) {
      setState(
            () {
          _focusData2 = _queryCourse.course;
          print(_focusData2);
        },
      );
    }
  }
  Widget build(BuildContext context) {
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
        child: Text('你好$_focusData2'),
      ),
    );
  }
}
