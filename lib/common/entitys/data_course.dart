// To parse this JSON data, do
//
//     final queryCourse = queryCourseFromJson(jsonString);

import 'dart:convert';

QueryCourse queryCourseFromJson(String str) => QueryCourse.fromJson(json.decode(str));

String queryCourseToJson(QueryCourse data) => json.encode(data.toJson());

class QueryCourse {
  QueryCourse({
    required this.course,
  });

  List<Course> course;

  factory QueryCourse.fromJson(Map<String, dynamic> json) => QueryCourse(
    course: List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": List<dynamic>.from(course.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.description,
    required this.classTags,
    required this.authorTags,
    required this.onlineTime,
    required this.addTime,
    required this.updateTime,
  });

  String id;
  String title;
  String imageUrl;
  String author;
  String description;
  String classTags;
  String authorTags;
  String onlineTime;
  String addTime;
  String updateTime;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["_id"],
    title: json["title"],
    imageUrl: json["imageUrl"],
    author: json["author"],
    description: json["description"],
    classTags: json["classTags"],
    authorTags: json["authorTags"],
    onlineTime: json["onlineTime"],
    addTime: json["addTime"],
    updateTime: json["updateTime"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "imageUrl": imageUrl,
    "author": author,
    "description": description,
    "classTags": classTags,
    "authorTags": authorTags,
    "onlineTime": onlineTime,
    "addTime": addTime,
    "updateTime": updateTime,
  };
}



CourseRequest courseRequestFromJson(String str) => CourseRequest.fromJson(json.decode(str));

String courseRequestToJson(CourseRequest data) => json.encode(data.toJson());

class CourseRequest {
  CourseRequest({
    required this.categoryId,
    required this.page,
    required this.limit,
  });

  String categoryId;
  int page;
  int limit;

  factory CourseRequest.fromJson(Map<String, dynamic> json) => CourseRequest(
    categoryId: json["category_id"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "page": page,
    "limit": limit,
  };
}
