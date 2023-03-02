// To parse this JSON data, do
//
//     final queryCourseDetail = queryCourseDetailFromJson(jsonString);

import 'dart:convert';

QueryCourseDetail queryCourseDetailFromJson(String str) => QueryCourseDetail.fromJson(json.decode(str));

String queryCourseDetailToJson(QueryCourseDetail data) => json.encode(data.toJson());

class QueryCourseDetail {
  QueryCourseDetail({
    required this.courseDetail,
  });

  List<CourseDetail> courseDetail;

  factory QueryCourseDetail.fromJson(Map<String, dynamic> json) => QueryCourseDetail(
    courseDetail: List<CourseDetail>.from(json["courseDetail"].map((x) => CourseDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courseDetail": List<dynamic>.from(courseDetail.map((x) => x.toJson())),
  };
}

class CourseDetail {
  CourseDetail({
    required this.id,
    required this.title,
    required this.classTags,
    required this.imageUrl,
    required this.author,
    required this.authorTags,
    required this.description,
    required this.onlineTime,
    required this.addTime,
    required this.updateTime,
  });

  String id;
  String title;
  String classTags;
  String imageUrl;
  String author;
  String authorTags;
  String description;
  String onlineTime;
  String addTime;
  String updateTime;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
    id: json["_id"],
    title: json["title"],
    classTags: json["classTags"],
    imageUrl: json["imageUrl"],
    author: json["author"],
    authorTags: json["authorTags"],
    description: json["description"],
    onlineTime: json["onlineTime"],
    addTime: json["addTime"],
    updateTime: json["updateTime"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "classTags": classTags,
    "imageUrl": imageUrl,
    "author": author,
    "authorTags": authorTags,
    "description": description,
    "onlineTime": onlineTime,
    "addTime": addTime,
    "updateTime": updateTime,
  };
}
CourseDetailRequest courseDetailRequestFromJson(String str) => CourseDetailRequest.fromJson(json.decode(str));

String courseDetailRequestToJson(CourseDetailRequest data) => json.encode(data.toJson());

class CourseDetailRequest {
  CourseDetailRequest({
    required this.courseId,
  });

  String courseId;

  factory CourseDetailRequest.fromJson(Map<String, dynamic> json) => CourseDetailRequest(
    courseId: json["course_id"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
  };
}
