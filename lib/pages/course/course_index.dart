import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'course_desc.dart';
import 'course_comment.dart';
import 'course_recom.dart';

import '../../api/apis.dart';
import '../../entitys/CourseData.dart';

/// 课程视频播放页面

class CourseIndexPage extends StatefulWidget {
  CourseIndexPage({Key? key}) : super(key: key);

  @override
  _CourseIndexPageState createState() => _CourseIndexPageState();
}

class _CourseIndexPageState extends State<CourseIndexPage> {
  late Future<PostsData> _postsDataq;

  @override
  void initState() {
    _postsDataq = GqlCourseAPI.indexPageInfo(schema: '', context: context);
    super.initState();
  }


  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        toolbarHeight: 0,
        toolbarOpacity: 0,
        backgroundColor: (Colors.black),
      ),
      body: Center(
        child: FutureBuilder<PostsData>(
          future: _postsDataq,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<LatestCourse> latestCourse =
                  snapshot.data!.latestCourse;
              final post = latestCourse[1];
              return VideoView(
                post.videoUrl,
                //'https://media.w3.org/2010/05/sintel/trailer.mp4',
                cover:
                    'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
              );
              //_buildListView(latestCourse);
            }
            if (snapshot.hasError) {
              return Text('${snapshot.error}', textAlign: TextAlign.center);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
