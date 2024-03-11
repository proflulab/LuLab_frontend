// To parse this JSON data, do
//
//     final queryLoginPassword = queryLoginPasswordFromJson(jsonString);

import 'dart:convert';

QueryLoginPassword queryLoginPasswordFromJson(String str) =>
    QueryLoginPassword.fromJson(json.decode(str));

String queryLoginPasswordToJson(QueryLoginPassword data) =>
    json.encode(data.toJson());

class QueryLoginPassword {
  QueryLoginPassword({
    required this.loginPassword,
  });

  LoginPassword loginPassword;

  factory QueryLoginPassword.fromJson(Map<String, dynamic> json) =>
      QueryLoginPassword(
        loginPassword: LoginPassword.fromJson(json["loginPassword"]),
      );

  Map<String, dynamic> toJson() => {
        "loginPassword": loginPassword.toJson(),
      };
}

class LoginPassword {
  LoginPassword({
    required this.status,
    required this.msg,
    required this.token,
    required this.refreshToken,
    required this.data,
  });

  String status;
  String msg;
  String token;
  String refreshToken;
  Data data;

  factory LoginPassword.fromJson(Map<String, dynamic> json) => LoginPassword(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
        refreshToken: json["refresh_token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
        "refresh_token": refreshToken,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.username,
    required this.profilePicture,
    required this.sex,
    required this.mobile,
    required this.wechat,
    required this.dsc,
  });

  String username;
  String profilePicture;
  int sex;
  String mobile;
  String wechat;
  String dsc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        profilePicture: json["profile_picture"],
        sex: json["sex"],
        mobile: json["mobile"],
        wechat: json["wechat"],
        dsc: json["dsc"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profile_picture": profilePicture,
        "sex": sex,
        "mobile": mobile,
        "wechat": wechat,
        "dsc": dsc,
      };
}

LoginPasswordRequest loginPasswordRequestFromJson(String str) =>
    LoginPasswordRequest.fromJson(json.decode(str));

String loginPasswordRequestToJson(LoginPasswordRequest data) =>
    json.encode(data.toJson());

class LoginPasswordRequest {
  LoginPasswordRequest({
    required this.mobile,
    required this.area,
    required this.password,
  });

  String mobile;
  String area;
  String password;

  factory LoginPasswordRequest.fromJson(Map<String, dynamic> json) =>
      LoginPasswordRequest(
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
