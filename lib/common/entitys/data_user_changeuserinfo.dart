// To parse this JSON data, do
//
//     final queryChangeUserInfo = queryChangeUserInfoFromJson(jsonString);

import 'dart:convert';

QueryChangeUserInfo queryChangeUserInfoFromJson(String str) =>
    QueryChangeUserInfo.fromJson(json.decode(str));

String queryChangeUserInfoToJson(QueryChangeUserInfo data) =>
    json.encode(data.toJson());

class QueryChangeUserInfo {
  QueryChangeUserInfo({
    required this.changeUserInfo,
  });

  ChangeUserInfo changeUserInfo;

  factory QueryChangeUserInfo.fromJson(Map<String, dynamic> json) =>
      QueryChangeUserInfo(
        changeUserInfo: ChangeUserInfo.fromJson(json["changeUserInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "changeUserInfo": changeUserInfo.toJson(),
      };
}

class ChangeUserInfo {
  ChangeUserInfo({
    required this.username,
    required this.imageUrl,
    required this.sex,
    required this.email,
    required this.dsc,
  });

  String username;
  String imageUrl;
  int sex;
  String email;
  String dsc;

  factory ChangeUserInfo.fromJson(Map<String, dynamic> json) => ChangeUserInfo(
        username: json["username"],
        imageUrl: json["imageUrl"],
        sex: json["sex"],
        email: json["email"],
        dsc: json["dsc"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "imageUrl": imageUrl,
        "sex": sex,
        "email": email,
        "dsc": dsc,
      };
}

ChangeUserInfoRequest changeUserInfoRequestFromJson(String str) =>
    ChangeUserInfoRequest.fromJson(json.decode(str));

String changeUserInfoRequestToJson(ChangeUserInfoRequest data) =>
    json.encode(data.toJson());

class ChangeUserInfoRequest {
  ChangeUserInfoRequest({
    required this.name,
    required this.sex,
    required this.email,
    required this.dsc,
  });

  String name;
  int sex;
  String email;
  String dsc;

  factory ChangeUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      ChangeUserInfoRequest(
        name: json["name"],
        sex: json["sex"],
        email: json["email"],
        dsc: json["dsc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sex": sex,
        "email": email,
        "dsc": dsc,
      };
}
