import 'dart:convert';

QueryCourseClassification queryCourseClassificationFromJson(String str) =>
    QueryCourseClassification.fromJson(json.decode(str));

String queryCourseClassificationToJson(QueryCourseClassification data) =>
    json.encode(data.toJson());

class QueryCourseClassification {
  QueryCourseClassification({
    required this.queryCourseClassification,
  });

  List<QueryCourseClassificationElement> queryCourseClassification;

  factory QueryCourseClassification.fromJson(Map<String, dynamic> json) =>
      QueryCourseClassification(
        queryCourseClassification: List<QueryCourseClassificationElement>.from(
            json["queryCourseClassification"]
                .map((x) => QueryCourseClassificationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queryCourseClassification": List<dynamic>.from(
            queryCourseClassification.map((x) => x.toJson())),
      };
}

class QueryCourseClassificationElement {
  QueryCourseClassificationElement({
    required this.id,
    required this.title,
    required this.mode,
    required this.addTime,
    this.timestamp,
  });

  String id;
  String title;
  String mode;
  DateTime addTime;
  dynamic timestamp;

  factory QueryCourseClassificationElement.fromJson(
          Map<String, dynamic> json) =>
      QueryCourseClassificationElement(
        id: json["_id"],
        title: json["title"],
        mode: json["mode"],
        addTime: DateTime.parse(json["addTime"]),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "mode": mode,
        "addTime": addTime.toIso8601String(),
        "timestamp": timestamp,
      };
}
