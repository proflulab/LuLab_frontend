// To parse this JSON data, do
//
//     final latestDirectCourse = latestDirectCourseFromJson(jsonString);

import 'dart:convert';

LatestDirectCourse latestDirectCourseFromJson(String str) =>
    LatestDirectCourse.fromJson(json.decode(str));

String latestDirectCourseToJson(LatestDirectCourse data) =>
    json.encode(data.toJson());

class LatestDirectCourse {
  LatestDirectCourse({
    required this.latestDirectCourse,
  });

  List<LatestDirectCourseElement> latestDirectCourse;

  factory LatestDirectCourse.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourse(
        latestDirectCourse: List<LatestDirectCourseElement>.from(
            json["latestDirectCourse"]
                .map((x) => LatestDirectCourseElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestDirectCourse":
            List<dynamic>.from(latestDirectCourse.map((x) => x.toJson())),
      };
}

class LatestDirectCourseElement {
  LatestDirectCourseElement({
    required this.id,
    required this.title,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
    required this.onlineTime,
    required this.imgUrl,
    required this.firstCourseId,
    required this.duration,
    required this.status,
  });

  String id;
  String title;
  String classTags;
  String description;
  String author;
  String authorTags;
  String category;
  String mode;
  String videoUrl;
  int onlineTime;
  String imgUrl;
  String firstCourseId;
  int duration;
  String status;

  factory LatestDirectCourseElement.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourseElement(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
        onlineTime: json["onlineTime"],
        imgUrl: json["imgUrl"],
        firstCourseId: json["firstCourseId"],
        duration: json["duration"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "classTags": classTags,
        "description": description,
        "author": author,
        "authorTags": authorTags,
        "category": category,
        "mode": mode,
        "videoUrl": videoUrl,
        "onlineTime": onlineTime,
        "imgUrl": imgUrl,
        "firstCourseId": firstCourseId,
        "duration": duration,
        "status": status,
      };
}

LatestDirectCourseRequest latestDirectCourseRequestFromJson(String str) =>
    LatestDirectCourseRequest.fromJson(json.decode(str));

String latestDirectCourseRequestToJson(LatestDirectCourseRequest data) =>
    json.encode(data.toJson());

class LatestDirectCourseRequest {
  LatestDirectCourseRequest({
    required this.mode,
    required this.authorId,
  });

  String mode;
  String authorId;

  factory LatestDirectCourseRequest.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourseRequest(
        mode: json["mode"],
        authorId: json["authorId"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "authorId": authorId,
      };
}
