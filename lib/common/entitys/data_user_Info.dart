// To parse this JSON data, do
//
//     final queryUserInfo = queryUserInfoFromJson(jsonString);

import 'dart:convert';

QueryUserInfo queryUserInfoFromJson(String str) => QueryUserInfo.fromJson(json.decode(str));

String queryUserInfoToJson(QueryUserInfo data) => json.encode(data.toJson());

class QueryUserInfo {
  QueryUserInfo({
    required this.userInfo,
  });

  UserInfo userInfo;

  factory QueryUserInfo.fromJson(Map<String, dynamic> json) => QueryUserInfo(
    userInfo: UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "userInfo": userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
    required this.username,
    required this.imageUrl,
    required this.sex,
    required this.wechat,
    required this.dsc,
  });

  String username;
  String imageUrl;
  int sex;
  String wechat;
  String dsc;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    username: json["username"],
    imageUrl: json["imageUrl"],
    sex: json["sex"],
    wechat: json["wechat"],
    dsc: json["dsc"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "imageUrl": imageUrl,
    "sex": sex,
    "wechat": wechat,
    "dsc": dsc,
  };
}
