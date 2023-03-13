// To parse this JSON data, do
//
//     final queryLoginPassword = queryLoginPasswordFromJson(jsonString);

import 'dart:convert';

QueryLoginPassword queryLoginPasswordFromJson(String str) => QueryLoginPassword.fromJson(json.decode(str));

String queryLoginPasswordToJson(QueryLoginPassword data) => json.encode(data.toJson());

class QueryLoginPassword {
  QueryLoginPassword({
    required this.loginPassword,
  });

  LoginPassword loginPassword;

  factory QueryLoginPassword.fromJson(Map<String, dynamic> json) => QueryLoginPassword(
    loginPassword: LoginPassword.fromJson(json["loginPassword"]),
  );

  Map<String, dynamic> toJson() => {
    "loginPassword": loginPassword.toJson(),
  };
}

class LoginPassword {
  LoginPassword({
    required this.msg,
    required this.status,
    required this.refreshToken,
    required this.token,
    required this.data,
  });

  String msg;
  String status;
  String refreshToken;
  String token;
  Data data;

  factory LoginPassword.fromJson(Map<String, dynamic> json) => LoginPassword(
    msg: json["msg"],
    status: json["status"],
    refreshToken: json["refresh_token"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "refresh_token": refreshToken,
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.username,
    required this.sex,
    required this.email,
    required this.wechat,
    required this.dsc,
    required this.profilePicture,
    required this.mobile,
  });

  String username;
  String sex;
  String email;
  String wechat;
  String dsc;
  String profilePicture;
  String mobile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    sex: json["sex"],
    email: json["email"],
    wechat: json["wechat"],
    dsc: json["dsc"],
    profilePicture: json["profile_picture"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "sex": sex,
    "email": email,
    "wechat": wechat,
    "dsc": dsc,
    "profile_picture": profilePicture,
    "mobile": mobile,
  };
}
LoginPasswordRequest loginPasswordRequestFromJson(String str) => LoginPasswordRequest.fromJson(json.decode(str));

String loginPasswordRequestToJson(LoginPasswordRequest data) => json.encode(data.toJson());

class LoginPasswordRequest {
  LoginPasswordRequest({
    required this.mobile,
    required this.password,
  });

  String mobile;
  String password;

  factory LoginPasswordRequest.fromJson(Map<String, dynamic> json) => LoginPasswordRequest(
    mobile: json["mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "password": password,
  };
}
