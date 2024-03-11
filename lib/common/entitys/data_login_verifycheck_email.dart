import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

QueryVerifyCheckEmail queryVerifyCheckEmailFromJson(String str) =>
    QueryVerifyCheckEmail.fromJson(json.decode(str));

String queryVerifyCheckEmailToJson(QueryVerifyCheckEmail data) =>
    json.encode(data.toJson());

class QueryVerifyCheckEmail {
  QueryVerifyCheckEmail({
    required this.verifyCheckEmail,
  });

  VerifyCheckEmail verifyCheckEmail;

  factory QueryVerifyCheckEmail.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return QueryVerifyCheckEmail(
      verifyCheckEmail: VerifyCheckEmail.fromJson(json["verifyCheck"] ?? {}),
    );
  }
  Map<String, dynamic> toJson() => {
        "verifyCheck": verifyCheckEmail.toJson(),
      };
}

class VerifyCheckEmail {
  VerifyCheckEmail({
    required this.token,
    required this.refresh_Token,
    required this.data,
  });

  String token;
  String refresh_Token;
  DataEmail data;

  factory VerifyCheckEmail.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return VerifyCheckEmail(
      token: json["token"] ?? "",
      refresh_Token: json["retoken"] ?? "",
      data: DataEmail.fromJson(json["data"] ?? {}),
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
        "retoken": refresh_Token,
        "data": data.toJson(),
      };
}

class DataEmail {
  DataEmail({
    this.name,
    this.avatar,
    this.sex,
    this.ctry_code,
    this.mobile,
    this.email,
    this.description,
  });

  String? name;
  String? avatar;
  int? sex;
  String? ctry_code;
  String? mobile;
  String? email;
  String? description;

  factory DataEmail.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return DataEmail(
      name: json["name"] ?? "",
      avatar: json["imageUrl"] ?? "",
      sex: json["sex"] ?? 0,
      ctry_code: json["ctry_code"] ?? "",
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": avatar,
        "sex": sex,
        "ctry_code": ctry_code,
        "mobile": mobile,
        "email": email,
        "description": description,
      };
}

VerifyCheckRequestEmail verifyCheckRequestEmailFromJson(String str) =>
    VerifyCheckRequestEmail.fromJson(json.decode(str));

String verifyCheckRequestEmailToJson(VerifyCheckRequestEmail data) =>
    json.encode(data.toJson());

class VerifyCheckRequestEmail {
  VerifyCheckRequestEmail({
    required this.email,
    required this.code,
  });

  String email;
  String code;

  factory VerifyCheckRequestEmail.fromJson(Map<String, dynamic> json) =>
      VerifyCheckRequestEmail(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
