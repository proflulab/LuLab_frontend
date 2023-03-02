// To parse this JSON data, do
//
//     final queryCourseCategory = queryCourseCategoryFromJson(jsonString);

import 'dart:convert';

QueryCourseCategory queryCourseCategoryFromJson(String str) => QueryCourseCategory.fromJson(json.decode(str));

String queryCourseCategoryToJson(QueryCourseCategory data) => json.encode(data.toJson());

class QueryCourseCategory {
  QueryCourseCategory({
    required this.courseCategory,
  });

  List<CourseCategory> courseCategory;

  factory QueryCourseCategory.fromJson(Map<String, dynamic> json) => QueryCourseCategory(
    courseCategory: List<CourseCategory>.from(json["courseCategory"].map((x) => CourseCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courseCategory": List<dynamic>.from(courseCategory.map((x) => x.toJson())),
  };
}

class CourseCategory {
  CourseCategory({
    required this.id,
    required this.title,
  });

  String id;
  String title;

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
