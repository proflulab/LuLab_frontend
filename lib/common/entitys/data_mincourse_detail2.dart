import 'dart:convert';

DetailMainCourse detailMainCourseFromJson(String str) =>
    DetailMainCourse.fromJson(json.decode(str));

String detailMainCourseToJson(DetailMainCourse data) =>
    json.encode(data.toJson());

class DetailMainCourse {
  DetailMainCourse({
    required this.detailMainCourse,
  });

  DetailMainCourseClass detailMainCourse;

  factory DetailMainCourse.fromJson(Map<String, dynamic> json) =>
      DetailMainCourse(
        detailMainCourse:
            DetailMainCourseClass.fromJson(json["detailMainCourse"]),
      );

  Map<String, dynamic> toJson() => {
        "detailMainCourse": detailMainCourse.toJson(),
      };
}

class DetailMainCourseClass {
  DetailMainCourseClass({
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
    required this.coverUrl,
    required this.firstCourseId,
    required this.duration,
    required this.onlineTime,
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
  dynamic coverUrl;
  String firstCourseId;
  int duration;
  int onlineTime;

  factory DetailMainCourseClass.fromJson(Map<String, dynamic> json) =>
      DetailMainCourseClass(
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
        coverUrl: json["coverUrl"],
        firstCourseId: json["firstCourseId"],
        duration: json["duration"],
        onlineTime: json["onlineTime"],
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
        "coverUrl": coverUrl,
        "firstCourseId": firstCourseId,
        "duration": duration,
        "onlineTime": onlineTime,
      };
}

DetailMainCourseRequest detailMainCourseRequestFromJson(String str) =>
    DetailMainCourseRequest.fromJson(json.decode(str));

String detailMainCourseRequestToJson(DetailMainCourseRequest data) =>
    json.encode(data.toJson());

class DetailMainCourseRequest {
  DetailMainCourseRequest({
    required this.courseId,
  });

  String courseId;

  factory DetailMainCourseRequest.fromJson(Map<String, dynamic> json) =>
      DetailMainCourseRequest(
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
      };
}
