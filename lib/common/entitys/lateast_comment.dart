import 'dart:convert';

LatestComment latestCommentFromJson(String str) =>
    LatestComment.fromJson(json.decode(str));

String latestCommentToJson(LatestComment data) => json.encode(data.toJson());

class LatestComment {
  LatestComment({
    required this.latestComment,
  });

  List<LatestCommentElement> latestComment;

  factory LatestComment.fromJson(Map<String, dynamic> json) => LatestComment(
        latestComment: List<LatestCommentElement>.from(
            json["latestComment"].map((x) => LatestCommentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestComment":
            List<dynamic>.from(latestComment.map((x) => x.toJson())),
      };
}

class LatestCommentElement {
  LatestCommentElement({
    required this.id,
    required this.content,
    required this.authorImg,
    required this.authorId,
  });

  String id;
  String content;
  String authorImg;
  String authorId;

  factory LatestCommentElement.fromJson(Map<String, dynamic> json) =>
      LatestCommentElement(
        id: json["_id"],
        content: json["content"],
        authorImg: json["authorImg"],
        authorId: json["authorId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "authorImg": authorImg,
        "authorId": authorId,
      };
}

//评论请求
LatestCommentRequest latestCommentRequestFromJson(String str) =>
    LatestCommentRequest.fromJson(json.decode(str));

String latestCommentRequestToJson(LatestCommentRequest data) =>
    json.encode(data.toJson());

class LatestCommentRequest {
  LatestCommentRequest({
    required this.courseId,
  });

  String courseId;

  factory LatestCommentRequest.fromJson(Map<String, dynamic> json) =>
      LatestCommentRequest(
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
      };
}
