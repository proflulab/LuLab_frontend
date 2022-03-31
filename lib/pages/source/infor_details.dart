import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:text_to_speech/text_to_speech.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import '../../common/api/apis.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
//import '../../common/staticdata/makdowndata.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class InforDetails extends StatefulWidget {
  const InforDetails({Key? key, required this.product}) : super(key: key);
  final LatestInformation product;

  @override
  _InforDetailsState createState() => _InforDetailsState();
}

class _InforDetailsState extends State<InforDetails> {
  late final infordata = widget.product;
  TextToSpeech tts = TextToSpeech();

  final TextEditingController _commentController = TextEditingController();
  bool click = false;

  late CommentResponse _latestComment;

  List<LatestComment> _commentData = [];

  @override
  void initState() {
    _handleComment();
    super.initState();
  }

  // 读取所有资讯评论数据
  _handleComment() async {
    _latestComment = await GqlCommentAPI.commentRequestInfo(
      variables: CommentRequest(
        category: '1',
        entityId: infordata.id,
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

  //添加评论
  _handleCommentAdd() async {
    CommentAddRequest variables = CommentAddRequest(
      content: _commentController.value.text,
      authorId: Global.profile.id,
      authorImg: Global.profile.iconUrl,
      authorName: Global.profile.name,
      category: '1',
      entityId: infordata.id,
    );
    await GqlCommentAPI.commenAddInfo(variables: variables, context: context);
    setState(() {
      _handleComment();
      _commentController.text = "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              PFspace.screenMargin, 0, PFspace.screenMargin, 0),
          //color: Colors.red,
          child: Column(
            children: [
              Flexible(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((content, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                                height: 100.h,
                                width: 1.sw,
                                child: Text(
                                  infordata.title,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: PFc.textPrimary,
                                    fontFamily: 'MyFontStyle',
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                height: 100.h,
                                width: 1.sw,
                                child: Text(
                                  infordata.releaseDate,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: PFc.textPrimary,
                                    fontFamily: '',
                                    fontSize: 23,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (index == 1) {
                          return PFMarkdown(data: infordata.mdtext);
                        } else if (index == 2) {
                          return Text(
                            '全部评价' + _commentData.length.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          );
                        }
                        return null;
                      }, childCount: 3),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (content, index) {
                          if (_commentData.isNotEmpty) {
                            return ListTile(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          _commentData[index].addTime,
                                          style: const TextStyle(
                                              color: Color(0xffaaaaaa),
                                              fontSize: 12),
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
                                                  color: Color(0xffaaaaaa),
                                                  fontSize: 12),
                                            ),
                                            Icon(
                                              Icons.thumb_up,
                                              color: Color(0xffaaaaaa),
                                              size: 16,
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Color(0xffaaaaaa),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Column(
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
                                // ElevatedButton(
                                //   onPressed: () {},
                                //   child: const Text("快去抢沙发"),
                                // )
                              ],
                            );
                            // Container(
                            //   //width: 10,
                            //   height: 100,
                            //   color: Colors.blue,
                            //   child: Center(
                            //     child: const Text("没有评价，显示图片"),
                            //   ),
                            // );
                          }
                        },
                        childCount: _commentData.length.toString() == "0"
                            ? 1
                            : _commentData.length,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80.h,
                color: PFc.backgroundPrimary,
                padding: EdgeInsets.only(
                  //left: PFspace.screenMargin,
                  //bottom: 10.h,
                  right: PFspace.screenMargin,
                ),
                child: Container(
                  color: PFc.backgroundPrimary,
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        iconSize: 40,
                        icon: const Icon(Icons.chevron_left),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50.h,
                          width: 500.w,
                          padding: EdgeInsets.only(
                              left: 25.w, top: 13.h, bottom: 10.h),
                          decoration: BoxDecoration(
                            color: PFc.themeColor10,
                            borderRadius: BorderRadius.circular(25.h),
                          ),
                          child: const Text(
                            '快来评论吧...',
                            //textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              color: PFc.textEmphasis,
                            ),
                          ),
                        ),
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            //isDismissible: false, //能否点击消失
                            builder: (BuildContext context) {
                              return AnimatedContainer(
                                height: click ? 100.h : 580.h,
                                //color: const Color.fromARGB(255, 255, 0, 0),
                                duration: const Duration(milliseconds: 10),
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(
                                    bottom: MediaQueryData.fromWindow(ui.window)
                                        .viewInsets
                                        .bottom),
                                child: Material(
                                  child: Container(
                                    height: 80.h,
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Row(
                                      children: <Widget>[
                                        renderTextInput(),
                                        renderSenderButton()
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     bottomItem(icon,),
                      //     const SizedBox(width: 30),
                      //     bottomItem()
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget renderTextInput() {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.text,
        //focusNode: focusNode(),
        controller: _commentController,
        autofocus: true,
        //maxLines: null,
        style: const TextStyle(fontSize: 14, color: PFc.textPrimary),
        textInputAction: TextInputAction.send,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          hintText: "快来评论吧...",
          hintStyle: const TextStyle(fontSize: 14, color: PFc.textPrimary),
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
          //widget.focusNode.unfocus();
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          //widget.submitAction(text);
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
        //widget.focusNode.unfocus();
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        //widget.submitAction(_commentController.text);
        if (_commentController.text.isEmpty) {
          toastInfo(msg: '评论内容不能为空');
          return;
        }
        _handleCommentAdd();
      },
    );
  }

  Widget bottomItem(IconData icon, Color iconColor, String number, int index) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          Text(number, style: const TextStyle(fontSize: 13))
        ],
      ),
      onTap: () {
        if (index == 0) {
          //actionCallback(FindActionType.agree);
        } else if (index == 1) {
          //actionCallback(FindActionType.collection);
        }
      },
    );
  }
}
