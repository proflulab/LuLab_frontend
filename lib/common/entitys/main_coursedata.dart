// To parse this JSON data, do
//
//     final mainCourseRequest = mainCourseRequestFromJson(jsonString);

import 'dart:convert';

MainCourseRequest mainCourseRequestFromJson(String str) =>
    MainCourseRequest.fromJson(json.decode(str));

String mainCourseRequestToJson(MainCourseRequest data) =>
    json.encode(data.toJson());

class MainCourseRequest {
  MainCourseRequest({
    required this.data,
  });

  final MainData data;

  factory MainCourseRequest.fromJson(Map<String, dynamic> json) =>
      MainCourseRequest(
        data: MainData.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class MainData {
  MainData({
    required this.latestMainCourse,
  });

  final List<LatestMainCourse> latestMainCourse;

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        latestMainCourse: List<LatestMainCourse>.from(
            json["latestMainCourse"].map((x) => LatestMainCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestMainCourse":
            List<dynamic>.from(latestMainCourse.map((x) => x.toJson())),
      };
}

class LatestMainCourse {
  LatestMainCourse({
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

  final String id;
  final String title;
  final String classTags;
  final String description;
  final String author;
  final String authorTags;
  final String category;
  final String mode;
  final String videoUrl;
  final String imgUrl;
  final String firstCourseId;
  final int duration;

  factory LatestMainCourse.fromJson(Map<String, dynamic> json) =>
      LatestMainCourse(
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
