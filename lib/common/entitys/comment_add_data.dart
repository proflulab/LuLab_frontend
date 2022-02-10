import 'dart:convert';

CommentAdd commentAddFromJson(String str) =>
    CommentAdd.fromJson(json.decode(str));

String commentAddToJson(CommentAdd data) => json.encode(data.toJson());

class CommentAdd {
  CommentAdd({
    required this.commentAdd,
  });

  CommentAddClass commentAdd;

  factory CommentAdd.fromJson(Map<String, dynamic> json) => CommentAdd(
        commentAdd: CommentAddClass.fromJson(json["commentAdd"]),
      );

  Map<String, dynamic> toJson() => {
        "commentAdd": commentAdd.toJson(),
      };
}

class CommentAddClass {
  CommentAddClass({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory CommentAddClass.fromJson(Map<String, dynamic> json) =>
      CommentAddClass(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

//评论添加
CommentAddRequest commentAddRequestFromJson(String str) =>
    CommentAddRequest.fromJson(json.decode(str));

String commentAddRequestToJson(CommentAddRequest data) =>
    json.encode(data.toJson());

class CommentAddRequest {
  CommentAddRequest({
    required this.content,
    required this.authorId,
    required this.authorImg,
    required this.courseId,
    required this.authorName,
  });

  String content;
  String authorId;
  String authorImg;
  String courseId;
  String authorName;

  factory CommentAddRequest.fromJson(Map<String, dynamic> json) =>
      CommentAddRequest(
        content: json["content"],
        authorId: json["authorId"],
        authorImg: json["authorImg"],
        courseId: json["courseId"],
        authorName: json["authorName"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "authorId": authorId,
        "authorImg": authorImg,
        "courseId": courseId,
        "authorName": authorName,
      };
}
