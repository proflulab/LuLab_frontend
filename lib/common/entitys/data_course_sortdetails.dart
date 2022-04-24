import 'dart:convert';

LatestDirectCourse latestDirectCourseFromJson(String str) =>
    LatestDirectCourse.fromJson(json.decode(str));

String latestDirectCourseToJson(LatestDirectCourse data) =>
    json.encode(data.toJson());

class LatestDirectCourse {
  LatestDirectCourse({
    required this.latestDirectCourse,
  });

  List<LatestDirectCourseElement> latestDirectCourse;

  factory LatestDirectCourse.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourse(
        latestDirectCourse: List<LatestDirectCourseElement>.from(
            json["latestDirectCourse"]
                .map((x) => LatestDirectCourseElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestDirectCourse":
            List<dynamic>.from(latestDirectCourse.map((x) => x.toJson())),
      };
}

class LatestDirectCourseElement {
  LatestDirectCourseElement({
    required this.id,
    required this.title,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
    required this.onlineTime,
    required this.imgUrl,
    required this.coverUrl,
    required this.firstCourseId,
    required this.duration,
    required this.status,
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
  final int onlineTime;
  final String imgUrl;
  final String coverUrl;
  final String firstCourseId;
  final int duration;
  final dynamic status;

  factory LatestDirectCourseElement.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourseElement(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
        onlineTime: json["onlineTime"],
        imgUrl: json["imgUrl"],
        coverUrl: json["coverUrl"],
        firstCourseId: json["firstCourseId"],
        duration: json["duration"],
        status: json["status"],
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
        "onlineTime": onlineTime,
        "imgUrl": imgUrl,
        "coverUrl": coverUrl,
        "firstCourseId": firstCourseId,
        "duration": duration,
        "status": status,
      };
}

LatestDirectCourseRequest latestDirectCourseRequestFromJson(String str) =>
    LatestDirectCourseRequest.fromJson(json.decode(str));

String latestDirectCourseRequestToJson(LatestDirectCourseRequest data) =>
    json.encode(data.toJson());

class LatestDirectCourseRequest {
  LatestDirectCourseRequest({
    required this.mode,
    required this.authorId,
    required this.limit,
    required this.skip,
  });

  final String mode;
  final String authorId;
  final int limit;
  final int skip;

  factory LatestDirectCourseRequest.fromJson(Map<String, dynamic> json) =>
      LatestDirectCourseRequest(
        mode: json["mode"],
        authorId: json["authorId"],
        limit: json["limit"],
        skip: json["skip"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "authorId": authorId,
        "limit": limit,
        "skip": skip,
      };
}
