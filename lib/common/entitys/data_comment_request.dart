
import 'dart:convert';

CommentResponse commentResponseFromJson(String str) =>
    CommentResponse.fromJson(json.decode(str));

String commentResponseToJson(CommentResponse data) =>
    json.encode(data.toJson());

class CommentResponse {
  CommentResponse({
    required this.latestComment,
  });

  final List<LatestComment> latestComment;

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponse(
        latestComment: List<LatestComment>.from(
            json["latestComment"].map((x) => LatestComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestComment":
            List<dynamic>.from(latestComment.map((x) => x.toJson())),
      };
}

class LatestComment {
  LatestComment({
    required this.id,
    required this.content,
    required this.entityId,
    required this.parentCommentId,
    required this.authorName,
    required this.authorId,
    required this.authorImg,
    required this.category,
    required this.addTime,
    required this.timestamp,
  });

  final String id;
  final String content;
  final String entityId;
  final dynamic parentCommentId;
  final String authorName;
  final String authorId;
  final String authorImg;
  final String category;
  final String addTime;
  final String timestamp;

  factory LatestComment.fromJson(Map<String, dynamic> json) => LatestComment(
        id: json["_id"],
        content: json["content"],
        entityId: json["entityId"],
        parentCommentId: json["parentCommentId"],
        authorName: json["authorName"],
        authorId: json["authorId"],
        authorImg: json["authorImg"],
        category: json["category"],
        addTime: json["addTime"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "entityId": entityId,
        "parentCommentId": parentCommentId,
        "authorName": authorName,
        "authorId": authorId,
        "authorImg": authorImg,
        "category": category,
        "addTime": addTime,
        "timestamp": timestamp,
      };
}


CommentRequest commentRequestFromJson(String str) =>
    CommentRequest.fromJson(json.decode(str));

String commentRequestToJson(CommentRequest data) => json.encode(data.toJson());

class CommentRequest {
  CommentRequest({
    required this.entityId,
    required this.category,
    required this.limit,
    required this.skip, 
  });

  final String entityId;
  final String category;
  final int limit;
  final int skip;

  factory CommentRequest.fromJson(Map<String, dynamic> json) => CommentRequest(
        entityId: json["entityId"],
        category: json["category"],
        limit: json["limit"],
        skip: json["skip"],
      );

  Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "category": category,
        "limit": limit,
        "skip": skip,
      };
}
