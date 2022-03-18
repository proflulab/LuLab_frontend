import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
//import '../../common/values/values.dart';
//import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

// import '../../common/widget/find_bottom_tool.dart';
// import '../../common/widget/find_config.dart';
// import '../../common/widget/widgets.dart';
import 'course_comment_send.dart';
import 'course_index.dart';

/// 课程评论页面

class CourseCommentPage extends StatefulWidget {
  final LatestDirectCourseElement courseData;
  const CourseCommentPage({Key? key, required this.courseData})
      : super(key: key);

  @override
  _CourseCommentPageState createState() => _CourseCommentPageState();
}

class _CourseCommentPageState extends State<CourseCommentPage> {
  late LatestComment _latestComment;
  late CommentAdd _commentAdd;
  List _commentData = [];

  @override
  void initState() {
    _handleComment();
    super.initState();
  }

  // 读取所有课程评论数据
  _handleComment() async {
    LatestCommentRequest variables = LatestCommentRequest(
      courseId: widget.courseData.firstCourseId,
    );
    _latestComment = await GqlLatestCommentAPI.indexPageInfo(
        variables: variables, context: context);
    setState(() {
      _commentData = _latestComment.latestComment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CustomScrollView(
            slivers: <Widget>[
              // ListView(
              //   children: [],
              // ),
              // SliverAppBar(
              //   pinned: true,
              //   expandedHeight: 230.0,
              //   flexibleSpace: FlexibleSpaceBar(
              //     title: const Text('复仇者联盟'),
              //     background: Image.network(
              //       'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              //       fit: BoxFit.fitHeight,
              //     ),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  return Text(
                    '全部评价' + _commentData.length.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  );
                }, childCount: 1),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(_commentData[index].authorImg),
                    ),
                    title: Column(
                      children: [
                        // 头衔
                        Row(
                          children: [
                            Text(
                              _commentData[index].authorName,
                              style: const TextStyle(fontSize: 15),
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // const Text(
                            //   '骨干学员',
                            //   style: TextStyle(
                            //       color: Color.fromARGB(255, 219, 24, 24),
                            //       fontSize: 15),
                            // )
                          ],
                        ),
                        // 评论
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                _commentData[index].content,
                                style: const TextStyle(fontSize: 13),
                                textAlign: TextAlign.start,
                                // overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        // 时间
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                _commentData[index].addTime,
                                style: const TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 12),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.mode_comment_outlined,
                                    color: Color(0xffaaaaaa),
                                    size: 16,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Color(0xffaaaaaa), fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.thumb_up,
                                    color: Color(0xffaaaaaa),
                                    size: 16,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Color(0xffaaaaaa), fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }, childCount: _commentData.length),
              )
            ],
          ),
        ),
        Container(
          height: 80.h,
          color: ProfluC.backgroundPrimary,
          padding: const EdgeInsets.only(left: 30, bottom: 10, right: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 30, top: 7, bottom: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text('快来评论吧...',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.amber,
                        )),
                  ),
                  onTap: () {
                    CtionComment.showActionSheet(context,
                        focusNode: FocusNode(),
                        placehold: '快来评论吧...',
                        submitAction: (text) {},
                        courseId: widget.courseData.firstCourseId);
                    //actionComment();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  //评价等级
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
}
