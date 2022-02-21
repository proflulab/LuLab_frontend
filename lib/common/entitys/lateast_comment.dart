// To parse this JSON data, do
//
//     final latestComment = latestCommentFromJson(jsonString);

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
    required this.courseId,
    required this.authorName,
    required this.authorId,
    required this.authorImg,
    this.category,
    required this.addTime,
  });

  String id;
  String content;
  String courseId;
  String authorName;
  String authorId;
  String authorImg;
  dynamic category;
  String addTime;

  factory LatestCommentElement.fromJson(Map<String, dynamic> json) =>
      LatestCommentElement(
        id: json["_id"],
        content: json["content"],
        courseId: json["courseId"],
        authorName: json["authorName"],
        authorId: json["authorId"],
        authorImg: json["authorImg"],
        category: json["category"],
        addTime: json["addTime"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "courseId": courseId,
        "authorName": authorName,
        "authorId": authorId,
        "authorImg": authorImg,
        "category": category,
        "addTime": addTime,
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
