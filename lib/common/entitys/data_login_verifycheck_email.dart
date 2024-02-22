import 'dart:convert';

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
    required this.success,
    required this.message,
    required this.token,
    required this.reToken,
    required this.data,
  });

  bool success;
  String message;
  String token;
  String reToken;
  DataEmail data;

  factory VerifyCheckEmail.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // 处理json为空的情况
      throw FormatException("JSON数据为空");
    }
    return VerifyCheckEmail(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      token: json["token"] ?? "",
      reToken: json["retoken"] ?? "",
      data: DataEmail.fromJson(json["data"] ?? {}),
    );
  }
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
        "retoken": reToken,
        "data": data.toJson(),
      };
}

class DataEmail {
  DataEmail({
    this.name,
    this.imageUrl,
    this.sex,
    this.mobile,
    this.email,
    this.description,
  });

  String? name;
  String? imageUrl;
  int? sex;
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
      imageUrl: json["imageUrl"] ?? "",
      sex: json["sex"] ?? 0,
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "sex": sex,
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
