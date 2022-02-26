import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';

/// 课程评论页面

class CourseCommentPageTwo extends StatefulWidget {
  final product;
  const CourseCommentPageTwo({Key? key, required this.product})
      : super(key: key);

  @override
  _CourseCommentPageTwoState createState() => _CourseCommentPageTwoState();
}

class _CourseCommentPageTwoState extends State<CourseCommentPageTwo> {
  late LatestComment _latestComment;
  List _commentData = [];

  @override
  void initState() {
    super.initState();
    _handleComment();
  }

  // 读取所有课程数据
  _handleComment() async {
    LatestCommentRequest variables = LatestCommentRequest(
      courseId: widget.product._id,
    );
    _latestComment = await GqlLatestCommentAPI.indexPageInfo(
        variables: variables, context: context);
    var commentData = _latestComment;

    setState(() {
      _commentData = commentData as List;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(
      children: [
        // 评论列表
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '全部评价(30)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              height: 500,
              child: ListView.builder(
                  itemCount: _commentData.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildEachCourseComment()),
            ),
          ],
        ),
      ],
    ));
  }

  Container buildEachCourseComment() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        title: Column(
          children: [
            // 头衔
            buildName(),
            // 评分
            buildScore(),
            // 评论
            buildCourseComment(),
            // 时间
            buildData()
          ],
        ),
      ),
    );
  }

  Row buildName() {
    return Row(
      children: const [
        Text(
          '有志青年',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '骨干学员',
          style: TextStyle(color: Color(0xffcccccc), fontSize: 15),
        )
      ],
    );
  }

  Row buildScore() {
    return Row(
      children: const [
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.orange,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: Colors.grey,
        ),
        Text("4.0"),
      ],
    );
  }

  Row buildData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            '2021-09-08 10:56',
            style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.mode_comment_outlined,
                color: Color(0xffaaaaaa),
                size: 16,
              ),
              Text(
                '1',
                style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
              ),
              Icon(
                Icons.thumb_up,
                color: Color(0xffaaaaaa),
                size: 16,
              ),
              Text(
                '1',
                style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildCourseComment() {
    return Row(
      children: const [
        Expanded(
          child: Text(
            '多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字多行评价文本，此处省略一万字',
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.start,
            // overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
