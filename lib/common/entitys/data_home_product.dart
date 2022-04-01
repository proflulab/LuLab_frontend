// To parse this JSON data, do
//
//     final latestTraining = latestTrainingFromJson(jsonString);

import 'dart:convert';

LatestTraining latestTrainingFromJson(String str) =>
    LatestTraining.fromJson(json.decode(str));

String latestTrainingToJson(LatestTraining data) => json.encode(data.toJson());

class LatestTraining {
  LatestTraining({
    required this.latestTraining,
  });

  List<LatestTrainingElement> latestTraining;

  factory LatestTraining.fromJson(Map<String, dynamic> json) => LatestTraining(
        latestTraining: List<LatestTrainingElement>.from(json["latestTraining"]
            .map((x) => LatestTrainingElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestTraining":
            List<dynamic>.from(latestTraining.map((x) => x.toJson())),
      };
}

class LatestTrainingElement {
  LatestTrainingElement({
    required this.id,
    required this.name,
    required this.description,
    required this.detailUrl,
    required this.imgUrl,
    required this.applyUrl,
    required this.trait,
    required this.addTime,
    required this.timestamp,
  });

  String id;
  String name;
  String description;
  String detailUrl;
  String imgUrl;
  String applyUrl;
  String trait;
  DateTime addTime;
  DateTime timestamp;

  factory LatestTrainingElement.fromJson(Map<String, dynamic> json) =>
      LatestTrainingElement(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        detailUrl: json["detailUrl"],
        imgUrl: json["imgUrl"],
        applyUrl: json["applyUrl"],
        trait: json["trait"],
        addTime: DateTime.parse(json["addTime"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "detailUrl": detailUrl,
        "imgUrl": imgUrl,
        "applyUrl": applyUrl,
        "trait": trait,
        "addTime": addTime.toIso8601String(),
        "timestamp": timestamp.toIso8601String(),
      };
}
