// To parse this JSON data, do
//
//     final queryCourseCatalogue = queryCourseCatalogueFromJson(jsonString);

import 'dart:convert';

QueryCourseCatalogue queryCourseCatalogueFromJson(String str) => QueryCourseCatalogue.fromJson(json.decode(str));

String queryCourseCatalogueToJson(QueryCourseCatalogue data) => json.encode(data.toJson());

class QueryCourseCatalogue {
  QueryCourseCatalogue({
    required this.courseCatalogue,
  });

  List<CourseCatalogue> courseCatalogue;

  factory QueryCourseCatalogue.fromJson(Map<String, dynamic> json) => QueryCourseCatalogue(
    courseCatalogue: List<CourseCatalogue>.from(json["courseCatalogue"].map((x) => CourseCatalogue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courseCatalogue": List<dynamic>.from(courseCatalogue.map((x) => x.toJson())),
  };
}

class CourseCatalogue {
  CourseCatalogue({
    required this.id,
    required this.title,
    required this.duration,
    required this.free,
  });

  String id;
  String title;
  String duration;
  bool free;

  factory CourseCatalogue.fromJson(Map<String, dynamic> json) => CourseCatalogue(
    id: json["_id"],
    title: json["title"],
    duration: json["duration"],
    free: json["free"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "duration": duration,
    "free": free,
  };
}
CourseCatalogueRequest courseCatalogueRequestFromJson(String str) => CourseCatalogueRequest.fromJson(json.decode(str));

String courseCatalogueRequestToJson(CourseCatalogueRequest data) => json.encode(data.toJson());

class CourseCatalogueRequest {
  CourseCatalogueRequest({
    required this.courseId,
  });

  String courseId;

  factory CourseCatalogueRequest.fromJson(Map<String, dynamic> json) => CourseCatalogueRequest(
    courseId: json["course_id"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
  };
}
