// To parse this JSON data, do
//
//     final latestModel = latestModelFromJson(jsonString);

import 'dart:convert';

LatestModel latestModelFromJson(String str) =>
    LatestModel.fromJson(json.decode(str));

String latestModelToJson(LatestModel data) => json.encode(data.toJson());

class LatestModel {
  LatestModel({
    required this.latestModel,
  });

  List<LatestModelElement> latestModel;

  factory LatestModel.fromJson(Map<String, dynamic> json) => LatestModel(
        latestModel: List<LatestModelElement>.from(
            json["latestModel"].map((x) => LatestModelElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestModel": List<dynamic>.from(latestModel.map((x) => x.toJson())),
      };
}

class LatestModelElement {
  LatestModelElement({
    required this.id,
    required this.name,
    required this.description,
    required this.identity,
    required this.imgUrl,
    required this.videoUrl,
    required this.growthDescription,
    this.timestamp,
  });

  String id;
  String name;
  String description;
  String identity;
  String imgUrl;
  String videoUrl;
  String growthDescription;
  dynamic timestamp;

  factory LatestModelElement.fromJson(Map<String, dynamic> json) =>
      LatestModelElement(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        identity: json["identity"],
        imgUrl: json["imgUrl"],
        videoUrl: json["videoUrl"],
        growthDescription: json["growthDescription"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "identity": identity,
        "imgUrl": imgUrl,
        "videoUrl": videoUrl,
        "growthDescription": growthDescription,
        "timestamp": timestamp,
      };
}
