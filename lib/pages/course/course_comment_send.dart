// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// import '../../common/widget/toast.dart';
import '../../common/global/global.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
// import '../../common/utils/utils.dart';
// import '../../common/entitys/entitys.dart';
import '../../common/values/values.dart';

typedef ActionInputSelect = void Function(String text);

//评论底部弹窗
class CtionComment {
  static void showActionSheet(
    BuildContext context, {
    required String courseId,
    required FocusNode focusNode,
    String placehold = '',
    required ActionInputSelect submitAction,
  }) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return CtionInputDialog(
            courseId: courseId,
            placehold: placehold,
            focusNode: focusNode,
            submitAction: submitAction,
            key: null,
          );
        });
  }
}

class CtionInputDialog extends StatefulWidget {
  final String courseId;
  final String placehold;
  final FocusNode focusNode;

  final ActionInputSelect submitAction;

  const CtionInputDialog({
    required Key? key,
    required this.courseId,
    required this.placehold,
    required this.focusNode,
    required this.submitAction,
  }) : super(key: key);

  @override
  _CtionInputDialogState createState() => _CtionInputDialogState();
}

class _CtionInputDialogState extends State<CtionInputDialog>
    with WidgetsBindingObserver {
  final TextEditingController _commentController = TextEditingController();
  //late CommentAdd _commentAdd;
  //late CommentAddClass _commentData2;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    if (mounted) {
      setState(() {});
    }
  }

  //添加评论
  _handleCommentAdd() async {
    CommentAddRequest variables = CommentAddRequest(
      content: _commentController.value.text,
      authorId: Global.profile.data.id,
      authorImg: Global.profile.data.img,
      courseId: widget.courseId,
      authorName: Global.profile.data.name,
    );
    //_commentAdd =
    await GqlCommentAddAPI.indexPageInfo(
        variables: variables, context: context);
    //var commentData2 = _commentAdd.commentAdd;

    // setState(() {
    //   _commentData2 = commentData2;
    // });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQueryData.fromWindow(ui.window);
    return AnimatedContainer(
      //color: Colors.transparent,
      duration: const Duration(milliseconds: 2),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
      child: Material(
        child: Container(
          height: 50,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[renderTextInput(), renderSenderButton()],
          ),
        ),
      ),
    );
  }

  Widget renderTextInput() {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.text,
        focusNode: widget.focusNode,
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
          hintText: widget.placehold,
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
          widget.focusNode.unfocus();
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          widget.submitAction(text);
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
        widget.focusNode.unfocus();
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        widget.submitAction(_commentController.text);
        // if (_commentController.text.isEmpty) {
        //   toastInfo(msg: '评论内容不能为空');
        //   return;
        // }
        _handleCommentAdd();
      },
    );
  }
}
