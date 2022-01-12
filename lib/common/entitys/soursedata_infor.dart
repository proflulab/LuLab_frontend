import 'dart:convert';

Inforponse inforponseFromJson(String str) =>
    Inforponse.fromJson(json.decode(str));

String inforponseToJson(Inforponse data) => json.encode(data.toJson());

class Inforponse {
  Inforponse({
    required this.latestInformation,
  });

  final List<LatestInformation> latestInformation;

  factory Inforponse.fromJson(Map<String, dynamic> json) => Inforponse(
        latestInformation: List<LatestInformation>.from(
            json["latestInformation"]
                .map((x) => LatestInformation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestInformation":
            List<dynamic>.from(latestInformation.map((x) => x.toJson())),
      };
}

class LatestInformation {
  LatestInformation({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  factory LatestInformation.fromJson(Map<String, dynamic> json) =>
      LatestInformation(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
