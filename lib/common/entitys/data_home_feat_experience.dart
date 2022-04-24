import 'dart:convert';

FeatsExperienceReponse featsExperienceReponseFromJson(String str) =>
    FeatsExperienceReponse.fromJson(json.decode(str));

String featsExperienceReponseToJson(FeatsExperienceReponse data) =>
    json.encode(data.toJson());

class FeatsExperienceReponse {
  FeatsExperienceReponse({
    required this.latestUserGrowth,
  });

  final List<LatestUserGrowth> latestUserGrowth; 

  factory FeatsExperienceReponse.fromJson(Map<String, dynamic> json) =>
      FeatsExperienceReponse(
        latestUserGrowth: List<LatestUserGrowth>.from(
            json["latestUserGrowth"].map((x) => LatestUserGrowth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestUserGrowth":
            List<dynamic>.from(latestUserGrowth.map((x) => x.toJson())),
      };
}

class LatestUserGrowth {
  LatestUserGrowth({
    required this.company,
    required this.beginTime,
    required this.endTime,
    required this.position,
    required this.desc,
    required this.logoUrl,
    required this.type,
  });

  final String company;
  final String beginTime;
  final String endTime;
  final String position;
  final String desc;
  final String logoUrl;
  final String type;

  factory LatestUserGrowth.fromJson(Map<String, dynamic> json) =>
      LatestUserGrowth(
        company: json["company"],
        beginTime: json["beginTime"],
        endTime: json["endTime"],
        position: json["position"],
        desc: json["desc"],
        logoUrl: json["logoUrl"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "beginTime": beginTime,
        "endTime": endTime,
        "position": position,
        "desc": desc,
        "logoUrl": logoUrl,
        "type": type,
      };
}

//request
FeatsExperienceRequest featsExperienceRequestFromJson(String str) =>
    FeatsExperienceRequest.fromJson(json.decode(str));

String featsExperienceRequestToJson(FeatsExperienceRequest data) =>
    json.encode(data.toJson());

class FeatsExperienceRequest {
  FeatsExperienceRequest({
    required this.userId,
    required this.limit,
    required this.skip,
  });

  final String userId;
  final int limit;
  final int skip;

  factory FeatsExperienceRequest.fromJson(Map<String, dynamic> json) =>
      FeatsExperienceRequest(
        userId: json["userId"],
        limit: json["limit"],
        skip: json["skip"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "limit": limit,
        "skip": skip,
      };
}
