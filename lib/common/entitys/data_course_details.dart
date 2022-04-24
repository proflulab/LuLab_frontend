import 'dart:convert';

//课程详情相应数据

DetailCourseResponse detailCourseResponseFromJson(String str) =>
    DetailCourseResponse.fromJson(json.decode(str));

String detailCourseResponseToJson(DetailCourseResponse data) =>
    json.encode(data.toJson());

class DetailCourseResponse {
  DetailCourseResponse({
    required this.detailCourse,
  });

  final List<DetailCoursel> detailCourse;

  factory DetailCourseResponse.fromJson(Map<String, dynamic> json) =>
      DetailCourseResponse(
        detailCourse: List<DetailCoursel>.from(
            json["detailCourse"].map((x) => DetailCoursel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detailCourse": List<dynamic>.from(detailCourse.map((x) => x.toJson())),
      };
}

class DetailCoursel {
  DetailCoursel({
    required this.id,
    required this.title,
    required this.dirTitle,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
    required this.imgUrl,
    required this.sort,
    required this.mainCourseId,
    required this.duration,
    required this.onlineTime,
    required this.addTime,
    required this.updateTime,
  });

  final String id;
  final String title;
  final String dirTitle;
  final String classTags;
  final String description;
  final String author;
  final String authorTags;
  final String category;
  final String mode;
  final String videoUrl;
  final String imgUrl;
  final int sort;
  final String mainCourseId;
  final int duration;
  final DateTime onlineTime;
  final DateTime addTime;
  final DateTime updateTime;

  factory DetailCoursel.fromJson(Map<String, dynamic> json) => DetailCoursel(
        id: json["_id"],
        title: json["title"],
        dirTitle: json["dirTitle"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
        imgUrl: json["imgUrl"],
        sort: json["sort"],
        mainCourseId: json["mainCourseId"],
        duration: json["duration"],
        onlineTime: DateTime.parse(json["onlineTime"]),
        addTime: DateTime.parse(json["addTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "dirTitle": dirTitle,
        "classTags": classTags,
        "description": description,
        "author": author,
        "authorTags": authorTags,
        "category": category,
        "mode": mode,
        "videoUrl": videoUrl,
        "imgUrl": imgUrl,
        "sort": sort,
        "mainCourseId": mainCourseId,
        "duration": duration,
        "onlineTime": onlineTime.toIso8601String(),
        "addTime": addTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
      };
}


//课程详情请求数据

DetailCourseRequest detailCourseRequestFromJson(String str) =>
    DetailCourseRequest.fromJson(json.decode(str));

String detailCourseRequestToJson(DetailCourseRequest data) =>
    json.encode(data.toJson());

class DetailCourseRequest {
  DetailCourseRequest({
    required this.dirId,
  });

  final String dirId;

  factory DetailCourseRequest.fromJson(Map<String, dynamic> json) =>
      DetailCourseRequest(
        dirId: json["dirId"],
      );

  Map<String, dynamic> toJson() => {
        "dirId": dirId,
      };
}
