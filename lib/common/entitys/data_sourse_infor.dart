import 'dart:convert';

//响应数据

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
    required this.introduction,
    required this.img,
    required this.author,
    required this.releaseDate,
    required this.content,
    required this.mdtext,
    required this.adv,
    required this.href,
  });

  final String title;
  final String introduction;
  final String img;
  final String author;
  final String releaseDate;
  final String content;
  final String mdtext;
  final String adv;
  final String href;

  factory LatestInformation.fromJson(Map<String, dynamic> json) =>
      LatestInformation(
        title: json["title"],
        introduction: json["introduction"],
        img: json["img"],
        author: json["author"],
        releaseDate: json["releaseDate"],
        content: json["content"],
        mdtext: json["mdtext"],
        adv: json["adv"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "introduction": introduction,
        "img": img,
        "author": author,
        "releaseDate": releaseDate,
        "content": content,
        "mdtext": mdtext,
        "adv": adv,
        "href": href,
      };
}

//请求参数
Inforrequest inforrequestFromJson(String str) =>
    Inforrequest.fromJson(json.decode(str));

String inforrequestToJson(Inforrequest data) => json.encode(data.toJson());

class Inforrequest {
  Inforrequest({
    required this.skip,
    required this.limit,
  });

  final int skip;
  final int limit;

  factory Inforrequest.fromJson(Map<String, dynamic> json) => Inforrequest(
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "skip": skip,
        "limit": limit,
      };
}
