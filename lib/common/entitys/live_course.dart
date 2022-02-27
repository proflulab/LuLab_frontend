// To parse this JSON data, do
//
//     final liveCourse = liveCourseFromJson(jsonString);

import 'dart:convert';

LiveCourse liveCourseFromJson(String str) =>
    LiveCourse.fromJson(json.decode(str));

String liveCourseToJson(LiveCourse data) => json.encode(data.toJson());

class LiveCourse {
  LiveCourse({
    required this.latestDirectCourse,
  });

  List<LatestDirectCourse> latestDirectCourse;

  factory LiveCourse.fromJson(Map<String, dynamic> json) => LiveCourse(
        latestDirectCourse: List<LatestDirectCourse>.from(
            json["latestDirectCourse"]
                .map((x) => LatestDirectCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestDirectCourse":
            List<dynamic>.from(latestDirectCourse.map((x) => x.toJson())),
      };
}

class LatestDirectCourse {
  LatestDirectCourse({
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

  factory LatestDirectCourse.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourse(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
        imgUrl: json["imgUrl"],
        firstCourseId: json["firstCourseId"],
        duration: json["duration"],
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
        "imgUrl": imgUrl,
        "firstCourseId": firstCourseId,
        "duration": duration,
      };
}
