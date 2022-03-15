// To parse this JSON data, do
//
//     final latestRecord = latestRecordFromJson(jsonString);

import 'dart:convert';

LatestRecord latestRecordFromJson(String str) =>
    LatestRecord.fromJson(json.decode(str));

String latestRecordToJson(LatestRecord data) => json.encode(data.toJson());

class LatestRecord {
  LatestRecord({
    required this.latestRecord,
  });

  List<LatestRecordElement> latestRecord;

  factory LatestRecord.fromJson(Map<String, dynamic> json) => LatestRecord(
        latestRecord: List<LatestRecordElement>.from(
            json["latestRecord"].map((x) => LatestRecordElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestRecord": List<dynamic>.from(latestRecord.map((x) => x.toJson())),
      };
}

class LatestRecordElement {
  LatestRecordElement({
    required this.courseId,
    required this.authorId,
    required this.status,
    required this.addTime,
    required this.onlineTime,
    required this.timestamp,
    required this.imgUrl,
    required this.title,
    required this.author,
    required this.description,
  });

  String courseId;
  String authorId;
  String status;
  String addTime;
  DateTime onlineTime;
  String timestamp;
  String imgUrl;
  String title;
  String author;
  String description;

  factory LatestRecordElement.fromJson(Map<String, dynamic> json) =>
      LatestRecordElement(
        courseId: json["courseId"],
        authorId: json["authorId"],
        status: json["status"],
        addTime: json["addTime"],
        onlineTime: DateTime.parse(json["onlineTime"]),
        timestamp: json["timestamp"],
        imgUrl: json["imgUrl"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "authorId": authorId,
        "status": status,
        "addTime": addTime,
        "onlineTime": onlineTime.toIso8601String(),
        "timestamp": timestamp,
        "imgUrl": imgUrl,
        "title": title,
        "author": author,
        "description": description,
      };
}

LatestRecordRequest latestRecordRequestFromJson(String str) =>
    LatestRecordRequest.fromJson(json.decode(str));

String latestRecordRequestToJson(LatestRecordRequest data) =>
    json.encode(data.toJson());

class LatestRecordRequest {
  LatestRecordRequest({
    required this.authorId,
  });

  String authorId;

  factory LatestRecordRequest.fromJson(Map<String, dynamic> json) =>
      LatestRecordRequest(
        authorId: json["authorId"],
      );

  Map<String, dynamic> toJson() => {
        "authorId": authorId,
      };
}
