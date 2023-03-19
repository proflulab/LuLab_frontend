// To parse this JSON data, do
//
//     final queryChangePassword = queryChangePasswordFromJson(jsonString);

import 'dart:convert';

QueryChangePassword queryChangePasswordFromJson(String str) => QueryChangePassword.fromJson(json.decode(str));

String queryChangePasswordToJson(QueryChangePassword data) => json.encode(data.toJson());

class QueryChangePassword {
  QueryChangePassword({
    required this.changePassword,
  });

  ChangePassword changePassword;

  factory QueryChangePassword.fromJson(Map<String, dynamic> json) => QueryChangePassword(
    changePassword: ChangePassword.fromJson(json["changePassword"]),
  );

  Map<String, dynamic> toJson() => {
    "changePassword": changePassword.toJson(),
  };
}

class ChangePassword {
  ChangePassword({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory ChangePassword.fromJson(Map<String, dynamic> json) => ChangePassword(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}

ChangePasswordRequest changePasswordRequestFromJson(String str) => ChangePasswordRequest.fromJson(json.decode(str));

String changePasswordRequestToJson(ChangePasswordRequest data) => json.encode(data.toJson());

class ChangePasswordRequest {
  ChangePasswordRequest({
    required this.mobile,
    required this.area,
    required this.password,
  });

  String mobile;
  int area;
  String password;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => ChangePasswordRequest(
    mobile: json["mobile"],
    area: json["area"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "area": area,
    "password": password,
  };
}
