import 'dart:convert';

//查询主课下每小节信息
DetailCourse detailCourseFromJson(String str) =>
    DetailCourse.fromJson(json.decode(str));

String detailCourseToJson(DetailCourse data) => json.encode(data.toJson());

class DetailCourse {
  DetailCourse({
    required this.detailCourse,
  });

  DetailCourseClass detailCourse;

  factory DetailCourse.fromJson(Map<String, dynamic> json) => DetailCourse(
        detailCourse: DetailCourseClass.fromJson(json["detailCourse"]),
      );

  Map<String, dynamic> toJson() => {
        "detailCourse": detailCourse.toJson(),
      };
}

class DetailCourseClass {
  DetailCourseClass({
    required this.subCourses,
    required this.id,
    required this.title,
    required this.classTags,
    this.description,
    required this.author,
    this.authorTags,
    this.category,
    this.videoUrl,
    this.imgUrl,
    required this.mainCourseId,
    required this.duration,
    required this.onlineTime,
    required this.addTime,
    required this.updateTime,
  });

  List<SubCourse> subCourses;
  String id;
  String title;
  String classTags;
  dynamic description;
  String author;
  dynamic authorTags;
  dynamic category;
  dynamic videoUrl;
  dynamic imgUrl;
  String mainCourseId;
  int duration;
  DateTime onlineTime;
  DateTime addTime;
  DateTime updateTime;

  factory DetailCourseClass.fromJson(Map<String, dynamic> json) =>
      DetailCourseClass(
        subCourses: List<SubCourse>.from(
            json["subCourses"].map((x) => SubCourse.fromJson(x))),
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        videoUrl: json["videoUrl"],
        imgUrl: json["imgUrl"],
        mainCourseId: json["mainCourseId"],
        duration: json["duration"],
        onlineTime: DateTime.parse(json["onlineTime"]),
        addTime: DateTime.parse(json["addTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "subCourses": List<dynamic>.from(subCourses.map((x) => x.toJson())),
        "_id": id,
        "title": title,
        "classTags": classTags,
        "description": description,
        "author": author,
        "authorTags": authorTags,
        "category": category,
        "videoUrl": videoUrl,
        "imgUrl": imgUrl,
        "mainCourseId": mainCourseId,
        "duration": duration,
        "onlineTime": onlineTime.toIso8601String(),
        "addTime": addTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
      };
}

class SubCourse {
  SubCourse({
    required this.subTitle,
    required this.courseId,
    required this.mainCourseId,
  });

  String subTitle;
  String courseId;
  String mainCourseId;

  factory SubCourse.fromJson(Map<String, dynamic> json) => SubCourse(
        subTitle: json["subTitle"],
        courseId: json["courseId"],
        mainCourseId: json["mainCourseId"],
      );

  Map<String, dynamic> toJson() => {
        "subTitle": subTitle,
        "courseId": courseId,
        "mainCourseId": mainCourseId,
      };
}

//课程请求
CourseRequest courseRequestFromJson(String str) =>
    CourseRequest.fromJson(json.decode(str));

String courseRequestToJson(CourseRequest data) => json.encode(data.toJson());

class CourseRequest {
  CourseRequest({
    required this.dirId,
    required this.courseId,
  });

  String dirId;
  String courseId;

  factory CourseRequest.fromJson(Map<String, dynamic> json) => CourseRequest(
        dirId: json["dirId"],
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "dirId": dirId,
        "courseId": courseId,
      };
}
