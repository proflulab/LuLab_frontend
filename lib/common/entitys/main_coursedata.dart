// To parse this JSON data, do
//
//     final latestMainCourse = latestMainCourseFromJson(jsonString);

import 'dart:convert';

LatestMainCourse latestMainCourseFromJson(String str) =>
    LatestMainCourse.fromJson(json.decode(str));

String latestMainCourseToJson(LatestMainCourse data) =>
    json.encode(data.toJson());

class LatestMainCourse {
  LatestMainCourse({
    required this.latestMainCourse,
  });

  List<LatestMainCourseElement> latestMainCourse;

  factory LatestMainCourse.fromJson(Map<String, dynamic> json) =>
      LatestMainCourse(
        latestMainCourse: List<LatestMainCourseElement>.from(
            json["latestMainCourse"]
                .map((x) => LatestMainCourseElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestMainCourse":
            List<dynamic>.from(latestMainCourse.map((x) => x.toJson())),
      };
}

class LatestMainCourseElement {
  LatestMainCourseElement({
    required this.id,
    required this.title,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
    required this.imgUrl,
    required this.firstCourseId,
    required this.duration,
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
  String imgUrl;
  String firstCourseId;
  int duration;

  factory LatestMainCourseElement.fromJson(Map<String, dynamic> json) =>
      LatestMainCourseElement(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"] == null ? null : json["classTags"],
        description: json["description"] == null ? null : json["description"],
        author: json["author"],
        authorTags: json["authorTags"] == null ? null : json["authorTags"],
        category: json["category"] == null ? null : json["category"],
        mode: json["mode"] == null ? null : json["mode"],
        videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        firstCourseId:
            json["firstCourseId"] == null ? null : json["firstCourseId"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "classTags": classTags == null ? null : classTags,
        "description": description == null ? null : description,
        "author": author,
        "authorTags": authorTags == null ? null : authorTags,
        "category": category == null ? null : category,
        "mode": mode == null ? null : mode,
        "videoUrl": videoUrl == null ? null : videoUrl,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "firstCourseId": firstCourseId == null ? null : firstCourseId,
        "duration": duration,
      };
}
