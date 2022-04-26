import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

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

  final TextEditingController _commentController = TextEditingController();
  bool click = false;

  late CommentResponse _latestComment;

  List<LatestComment> _commentData = [];

  @override
  void initState() {
    _handleComment();
    super.initState();
    _commentController.addListener(() {
      setState(() {});
    });
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
      authorId: Global.profile.id!,
      authorImg: Global.profile.profileImgUrl!,
      authorName: Global.profile.name!,
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
    return KeyboardDismisser(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          bottomNavigationBar: _bottomWidget(),
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              PFspace.screenMargin,
              0,
              PFspace.screenMargin,
              20,
            ),
            //color: Colors.red,
            child: Column(
              children: [
                _buildContent(),
                if (infordata.adv.isNotEmpty) _buildAdWidget(),
                _buildCommentWidget(),
              ],
            ),
          )),
    );
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
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Text("快去抢沙发"),
                      // )
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

  Widget _buildAdWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // launch(infordata.href);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: 704.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedImage.typeLaod(infordata.adv),
        ),
      ),
    );
  }

  Container _buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30.w, 30.w, 30.w, 8),
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
            margin: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 0),
            width: 1.sw,
            child: Row(
              children: [
                Text(
                  PFTime.client(int.parse(infordata.releaseDate), "ymd"),
                  textAlign: TextAlign.left,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: PFc.textSecondary,
                    fontFamily: '',
                    fontSize: 11,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          PFMarkdown(
            data: infordata.mdtext,
            p: const TextStyle(fontSize: 18, height: 1.8),
            pPadding: EdgeInsets.fromLTRB(30.w, 5, 30.w, 5),
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
}
