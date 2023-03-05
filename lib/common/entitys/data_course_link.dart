// To parse this JSON data, do
//
//     final queryCourseLink = queryCourseLinkFromJson(jsonString);

import 'dart:convert';

QueryCourseLink queryCourseLinkFromJson(String str) => QueryCourseLink.fromJson(json.decode(str));

String queryCourseLinkToJson(QueryCourseLink data) => json.encode(data.toJson());

class QueryCourseLink {
  QueryCourseLink({
    required this.courseLink,
  });

  CourseLink courseLink;

  factory QueryCourseLink.fromJson(Map<String, dynamic> json) => QueryCourseLink(
    courseLink: CourseLink.fromJson(json["courseLink"]),
  );

  Map<String, dynamic> toJson() => {
    "courseLink": courseLink.toJson(),
  };
}

class CourseLink {
  CourseLink({
    required this.link,
  });

  String link;

  factory CourseLink.fromJson(Map<String, dynamic> json) => CourseLink(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
CourseLinkRequest courseLinkRequestFromJson(String str) => CourseLinkRequest.fromJson(json.decode(str));

String courseLinkRequestToJson(CourseLinkRequest data) => json.encode(data.toJson());

class CourseLinkRequest {
  CourseLinkRequest({
    required this.detailId,
  });

  String detailId;

  factory CourseLinkRequest.fromJson(Map<String, dynamic> json) => CourseLinkRequest(
    detailId: json["detail_id"],
  );

  Map<String, dynamic> toJson() => {
    "detail_id": detailId,
  };
}
