import 'dart:convert';

CommentAddResponse commentAddResponseFromJson(String str) =>
    CommentAddResponse.fromJson(json.decode(str));

String commentAddResponseToJson(CommentAddResponse data) =>
    json.encode(data.toJson());

class CommentAddResponse {
  CommentAddResponse({
     required this.commentAdd,
  });

  final CommentAdd commentAdd;

  factory CommentAddResponse.fromJson(Map<String, dynamic> json) =>
      CommentAddResponse(
        commentAdd: CommentAdd.fromJson(json["commentAdd"]),
      );

  Map<String, dynamic> toJson() => {
        "commentAdd": commentAdd.toJson(),
      };
}

class CommentAdd {
  CommentAdd({
    required this.status,
    required this.msg,
  });

  final String status;
  final String msg;

  factory CommentAdd.fromJson(Map<String, dynamic> json) => CommentAdd(
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
    required this.entityId,
    required this.category,
    required this.authorName,
    required this.authorId,
    required this.authorImg,
  });

  final String content;
  final String entityId;
  final String category;
  final String authorName;
  final String authorId;
  final String authorImg;

  factory CommentAddRequest.fromJson(Map<String, dynamic> json) =>
      CommentAddRequest(
        content: json["content"],
        entityId: json["entityId"],
        category: json["category"],
        authorName: json["authorName"],
        authorId: json["authorId"],
        authorImg: json["authorImg"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "entityId": entityId,
        "category": category,
        "authorName": authorName,
        "authorId": authorId,
        "authorImg": authorImg,
      };
}
