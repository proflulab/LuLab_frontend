import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

QueryVerifyCheck queryVerifyCheckFromJson(String str) =>
    QueryVerifyCheck.fromJson(json.decode(str));

String queryVerifyCheckToJson(QueryVerifyCheck data) =>
    json.encode(data.toJson());

class QueryVerifyCheck {
  QueryVerifyCheck({
    required this.verifyCheck,
  });

  VerifyCheck verifyCheck;

  factory QueryVerifyCheck.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return QueryVerifyCheck(
      verifyCheck: VerifyCheck.fromJson(json["verifyCheck"] ?? {}),
    );
  }
  Map<String, dynamic> toJson() => {
        "verifyCheck": verifyCheck.toJson(),
      };
}

class VerifyCheck {
  VerifyCheck({
    required this.token,
    required this.refresh_token,
    required this.user,
  });

  String token;
  String refresh_token;
  Data user;

  factory VerifyCheck.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return VerifyCheck(
      token: json["token"] ?? "",
      refresh_token: json["retoken"] ?? "",
      user: Data.fromJson(json["user"] ?? {}),
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
        "retoken": refresh_token,
        "user": user.toJson(),
      };
}

class Data {
  Data({
    this.name,
    this.avatar,
    this.sex,
    this.mobile,
    this.email,
    this.description,
  });

  String? name;
  String? avatar;
  int? sex;
  String? mobile;
  String? email;
  String? description;

  factory Data.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return Data(
      name: json["name"] ?? "",
      avatar: json["imageUrl"] ?? "",
      sex: json["sex"] ?? 0,
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": avatar,
        "sex": sex,
        "mobile": mobile,
        "email": email,
        "description": description,
      };
}

VerifyCheckRequest verifyCheckRequestFromJson(String str) =>
    VerifyCheckRequest.fromJson(json.decode(str));

String verifyCheckRequestToJson(VerifyCheckRequest data) =>
    json.encode(data.toJson());

class VerifyCheckRequest {
  VerifyCheckRequest({
    required this.mobile,
    required this.code,
    required this.ctry_code,
  });

  String mobile;
  String code;
  String ctry_code;

  factory VerifyCheckRequest.fromJson(Map<String, dynamic> json) =>
      VerifyCheckRequest(
        mobile: json["mobile"],
        code: json["code"],
        ctry_code: json["ctry_code"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "code": code,
        "ctry_code": ctry_code,
      };
}
