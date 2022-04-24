import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/cached_network_image.dart';
import '../../common/widget/text_widget.dart';
import '../../common/widget/toast.dart';

/// 课程评论页面
class CourseCommentPage extends StatefulWidget {
  final LatestDirectCourseElement courseData;
  const CourseCommentPage({Key? key, required this.courseData})
      : super(key: key);

  @override
  _CourseCommentPageState createState() => _CourseCommentPageState();
}

class _CourseCommentPageState extends State<CourseCommentPage> {
  final TextEditingController _commentController = TextEditingController();
  late CommentResponse _latestComment;
  //final FocusNode _commentFocus = FocusNode();
  List<LatestComment> _commentData = [];

  bool click = false;

  @override
  void initState() {
    _handleComment();
    super.initState();
  }

  // 读取所有课程评论数据
  _handleComment() async {
    _latestComment = await GqlCommentAPI.commentRequestInfo(
      variables: CommentRequest(
        category: '2',
        entityId: widget.courseData.firstCourseId,
        limit: 0,
        skip: 0,
      ),
      context: context,
    );
    setState(
      () {
        _commentData = _latestComment.latestComment;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  //添加评论
  _handleCommentAdd() async {
    CommentAddRequest variables = CommentAddRequest(
      content: _commentController.value.text,
      authorId: Global.profile.id!,
      authorImg: Global.profile.profileImgUrl!,
      authorName: Global.profile.name!,
      category: '2',
      entityId: widget.courseData.firstCourseId,
    );
    await GqlCommentAPI.commenAddInfo(variables: variables, context: context);
    setState(() {
      _handleComment();
      _commentController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomWidget(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            PFspace.screenMargin,
            20,
            PFspace.screenMargin,
            20,
          ),
          //color: Colors.red,
          child: Column(
            children: [
              _buildCommentWidget(),
            ],
          ),
        ));
    //原版评论
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Flexible(
    //       flex: 1,
    //       child: CustomScrollView(
    //         slivers: <Widget>[
    //           SliverList(
    //             delegate: SliverChildBuilderDelegate((content, index) {
    //               return Text(
    //                 '全部评价' + _commentData.length.toString(),
    //                 style: const TextStyle(
    //                     fontSize: 20, fontWeight: FontWeight.w500),
    //               );
    //             }, childCount: 1),
    //           ),
    //           SliverList(
    //             delegate: SliverChildBuilderDelegate((content, index) {
    //               return ListTile(
    //                 // leading: CircleAvatar(
    //                 //   backgroundImage:
    //                 //       AssetImage(_commentData[index].authorImg),
    //                 // ),
    //                 title: Column(
    //                   children: [
    //                     // 头衔
    //                     Row(
    //                       children: [
    //                         Text(
    //                           _commentData[index].authorName,
    //                           style: const TextStyle(fontSize: 15),
    //                         ),
    //                         // const SizedBox(
    //                         //   width: 10,
    //                         // ),
    //                         // const Text(
    //                         //   '骨干学员',
    //                         //   style: TextStyle(
    //                         //       color: Color.fromARGB(255, 219, 24, 24),
    //                         //       fontSize: 15),
    //                         // )
    //                       ],
    //                     ),
    //                     // 评论
    //                     Row(
    //                       children: [
    //                         Expanded(
    //                           child: Text(
    //                             _commentData[index].content,
    //                             style: const TextStyle(fontSize: 13),
    //                             textAlign: TextAlign.start,
    //                             // overflow: TextOverflow.ellipsis,
    //                             maxLines: 2,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                     // 时间
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         Expanded(
    //                           flex: 4,
    //                           child: Text(
    //                             _commentData[index].addTime,
    //                             style: const TextStyle(
    //                                 color: Color(0xffaaaaaa), fontSize: 12),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           flex: 1,
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceAround,
    //                             children: const [
    //                               Icon(
    //                                 Icons.mode_comment_outlined,
    //                                 color: Color(0xffaaaaaa),
    //                                 size: 16,
    //                               ),
    //                               Text(
    //                                 '1',
    //                                 style: TextStyle(
    //                                     color: Color(0xffaaaaaa), fontSize: 12),
    //                               ),
    //                               Icon(
    //                                 Icons.thumb_up,
    //                                 color: Color(0xffaaaaaa),
    //                                 size: 16,
    //                               ),
    //                               Text(
    //                                 '1',
    //                                 style: TextStyle(
    //                                     color: Color(0xffaaaaaa), fontSize: 12),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             }, childCount: _commentData.length),
    //           )
    //         ],
    //       ),
    //     ),
    //     Container(
    //       height: 80.h,
    //       color: PFc.backgroundPrimary,
    //       padding: EdgeInsets.only(
    //           left: PFspace.screenMargin,
    //           bottom: 10.h,
    //           right: PFspace.screenMargin),
    //       child: Container(
    //         color: PFc.backgroundPrimary,
    //         padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             GestureDetector(
    //               child: Container(
    //                 height: 50.h,
    //                 width: 500.w,
    //                 padding:
    //                     EdgeInsets.only(left: 25.w, top: 13.h, bottom: 10.h),
    //                 decoration: BoxDecoration(
    //                   color: PFc.themeColor10,
    //                   borderRadius: BorderRadius.circular(25.h),
    //                 ),
    //                 child: const Text(
    //                   '快来评论吧...',
    //                   //textAlign: TextAlign.justify,
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                     color: PFc.textEmphasis,
    //                   ),
    //                 ),
    //               ),
    //               onTap: () async {
    //                 showModalBottomSheet(
    //                   context: context,
    //                   backgroundColor: Colors.transparent,
    //                   //isDismissible: false, //能否点击消失
    //                   builder: (BuildContext context) {
    //                     return AnimatedContainer(
    //                       height: click ? 100.h : 580.h,
    //                       //color: const Color.fromARGB(255, 255, 0, 0),
    //                       duration: const Duration(milliseconds: 10),
    //                       alignment: Alignment.bottomCenter,
    //                       padding: EdgeInsets.only(
    //                           bottom: MediaQueryData.fromWindow(ui.window)
    //                               .viewInsets
    //                               .bottom),
    //                       child: Material(
    //                         child: Container(
    //                           height: 80.h,
    //                           color: Colors.white,
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 16, vertical: 8),
    //                           child: Row(
    //                             children: <Widget>[
    //                               renderTextInput(),
    //                               renderSenderButton()
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildCommentWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PFtext.text1(
              text: '全部评价' + _commentData.length.toString(), fontSize: 18),
          const SizedBox(height: 5),
          _commentData.isEmpty
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/images/comment.svg",
                        color: PFc.themeColor20,
                        semanticsLabel: 'A red up arrow',
                        width: 0.3.sw,
                      ),
                      SizedBox(height: 0.03.sh),
                      const Text("还没有人评论"),
                      SizedBox(height: 0.03.sh),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, index) {
                    LatestComment comment = _commentData[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(33.w),
                            child: SizedBox(
                              width: 66.w,
                              height: 66.w,
                              child: CachedImage.typeLaod(comment.authorImg),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              PFtext.text1(
                                  text: comment.authorName, fontSize: 14),
                              const SizedBox(height: 5),
                              PFtext.text1(
                                  text: comment.content,
                                  fontSize: 16,
                                  maxLines: 9),
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                  itemCount: _commentData.length,
                ),
        ],
      ),
    );
  }

  Widget _bottomWidget() {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, left: 24.w),
        child: SizedBox(
          height: 120.w,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 80.w,
                decoration: BoxDecoration(
                  color: const Color(0xffebebeb),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                      hintText: "写评论", border: InputBorder.none),
                  // autofocus: true,
                  style: const TextStyle(fontSize: 14, color: PFc.textPrimary),
                ),
              )),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _sendComment,
                child: Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: PFtext.text1(
                    text: "发送",
                    fontSize: 16,
                    color: _commentController.text.isEmpty
                        ? PFc.textSecondary
                        : PFc.textEmphasis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _sendComment() {
    FocusScope.of(context).unfocus();
    if (_commentController.text.isEmpty) {
      toastInfo(msg: '评论内容不能为空');
      return;
    }
    _handleCommentAdd();
  }

  Widget renderTextInput() {
    return Expanded(
      child: TextField(
        //keyboardType: TextInputType.text,
        //focusNode: FocusNode(),
        controller: _commentController,
        autofocus: true,
        //maxLines: null,
        style: const TextStyle(fontSize: 14, color: PFc.textPrimary),
        //textInputAction: TextInputAction.send,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          hintText: '快来评论吧...',
          hintStyle: const TextStyle(fontSize: 14, color: PFc.textEmphasis),
          counterText: '',
          filled: true,
          fillColor: PFc.themeColor10,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(style: BorderStyle.none, color: Colors.lime),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.none, color: Colors.transparent),
              borderRadius: BorderRadius.circular(30)),
        ),
        onSubmitted: (text) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget renderSenderButton() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        child: const Center(
          child: Text('发送',
              style: TextStyle(
                fontSize: 16,
                color: PFc.textEmphasis,
              )),
        ),
      ),
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        FocusScope.of(context).requestFocus(FocusNode());
        _handleCommentAdd();
      },
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
