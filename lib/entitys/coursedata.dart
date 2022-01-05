import 'dart:convert';

PostsData postsDataFromJson(String str) => PostsData.fromJson(json.decode(str));

String postsDataToJson(PostsData data) => json.encode(data.toJson());

class PostsData {
  PostsData({
    required this.latestCourse,
  });

  final List<LatestCourse> latestCourse;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        latestCourse: List<LatestCourse>.from(
            json["latestCourse"].map((x) => LatestCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestCourse": List<dynamic>.from(latestCourse.map((x) => x.toJson())),
      };
}

class LatestCourse {
  LatestCourse({
    required this.id,
    required this.title,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
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
  final int duration;

  factory LatestCourse.fromJson(Map<String, dynamic> json) => LatestCourse(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
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
        "duration": duration,
      };
}
