import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
// import '../../common/values/values.dart';
// import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';

//import 'course_comment_detail.dart';
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
  //评论监控
  final TextEditingController _commentController = TextEditingController();
  late LatestComment _latestComment;
  late CommentAdd _commentAdd;
  List _commentData = [];
  late CommentAddClass _commentData2;

  @override
  void initState() {
    super.initState();
    _handleComment();
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

  //添加评论
  _handleCommentAdd() async {
    CommentAddRequest variables = CommentAddRequest(
      content: _commentController.value.text,
      authorId: Global.profile.data.id,
      authorImg: Global.profile.data.img,
      courseId: widget.courseData.firstCourseId,
      authorName: Global.profile.data.name,
    );
    _commentAdd = await GqlCommentAddAPI.indexPageInfo(
        variables: variables, context: context);
    var commentData2 = _commentAdd.commentAdd;

    setState(() {
      _commentData2 = commentData2;
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CourseIndexPage(
              product: widget.courseData,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '全部评价' + _commentData.length.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          // Flexible(
          //     child:
          SizedBox(
            height: _commentData.length * 100,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _commentData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_commentData[index].authorImg),
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
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Text(
                          //   '骨干学员',
                          //   style: TextStyle(color: Color(0xffcccccc), fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      )
                    ],
                  ),
                );
              },
            ),
            //)
          )
        ],
      ),
    );

    // Container(
    //   color: Colors.red,
    //   height: 100,
    //   width: 1.sw,
    //   child: SingleChildScrollView(
    //     child: ListView(
    //       children: [
    //         Text(
    //           '全部评价' + _commentData.length.toString(),
    //           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  text() {
    Column(
      children: <Widget>[
        SizedBox(
            width: 1.sw,
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '全部评价' + _commentData.length.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(top: 30),
                  //   height: 500,
                  //   child: ListView.builder(
                  //     itemCount: _commentData.length,
                  //     itemBuilder: (BuildContext context, int index) =>
                  //         CommentDetail(product: _commentData[index]),
                  //   ),
                  // ),
                ],
              )),
            )),
        // SizedBox(
        //   height: 53,
        //   width: 375,
        //   child: ElevatedButton(
        //     child: const Text("点击"),
        //     onPressed: () {
        //       showModalBottomSheet(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return SizedBox(
        //                 height: 500,
        //                 width: 375,
        //                 child: Column(
        //                   children: [
        //                     inputTextEdit(
        //                       controller: _commentController,
        //                       hintText: "请输入评论",
        //                       marginTop: 30,
        //                       autofocus: true,
        //                       width: 622,
        //                       height: 100,
        //                     ),
        //                     Container(
        //                       //height: 100.h,
        //                       margin: const EdgeInsets.only(top: 50),
        //                       child: btnFlatButtonWidget(
        //                         width: 622,
        //                         height: 112,
        //                         onPressed: () {
        //                           _handleCommentAdd();
        //                         },
        //                         gbColor: ProfluC.primaryElement,
        //                         title: "发送",
        //                       ),
        //                     ),
        //                   ],
        //                 ));
        //           });
        //     },
        //   ),
        // )
      ],
    );
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
            // buildScore(),
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
