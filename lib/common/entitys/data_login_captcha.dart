// To parse this JSON data, do
//
//     final queryLoginCaptcha = queryLoginCaptchaFromJson(jsonString);

import 'dart:convert';

QueryLoginCaptcha queryLoginCaptchaFromJson(String str) => QueryLoginCaptcha.fromJson(json.decode(str));

String queryLoginCaptchaToJson(QueryLoginCaptcha data) => json.encode(data.toJson());

class QueryLoginCaptcha {
  QueryLoginCaptcha({
    required this.loginCaptcha,
  });

  LoginCaptcha loginCaptcha;

  factory QueryLoginCaptcha.fromJson(Map<String, dynamic> json) => QueryLoginCaptcha(
    loginCaptcha: LoginCaptcha.fromJson(json["loginCaptcha"]),
  );

  Map<String, dynamic> toJson() => {
    "loginCaptcha": loginCaptcha.toJson(),
  };
}

class LoginCaptcha {
  LoginCaptcha({
    required this.status,
    required this.msg,
    required this.refreshToken,
    required this.token,
    required this.data,
  });

  String status;
  String msg;
  String refreshToken;
  String token;
  Data data;

  factory LoginCaptcha.fromJson(Map<String, dynamic> json) => LoginCaptcha(
    status: json["status"],
    msg: json["msg"],
    refreshToken: json["refresh_token"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "refresh_token": refreshToken,
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.username,
    required this.profilePicture,
    required this.sex,
    required this.mobile,
    required this.empty,
    required this.email,
    required this.dsc,
  });

  String username;
  String profilePicture;
  String sex;
  String mobile;
  String empty;
  String email;
  String dsc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    profilePicture: json["profile_picture"],
    sex: json["sex"],
    mobile: json["mobile"],
    empty: json[""],
    email: json["email"],
    dsc: json["dsc"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "profile_picture": profilePicture,
    "sex": sex,
    "mobile": mobile,
    "": empty,
    "email": email,
    "dsc": dsc,
  };
}

LoginCaptchaRequest loginCaptchaRequestFromJson(String str) => LoginCaptchaRequest.fromJson(json.decode(str));

String loginCaptchaRequestToJson(LoginCaptchaRequest data) => json.encode(data.toJson());

class LoginCaptchaRequest {
  LoginCaptchaRequest({
    required this.mobile,
    required this.area,
    required this.code,
  });

  String mobile;
  int area;
  String code;

  factory LoginCaptchaRequest.fromJson(Map<String, dynamic> json) => LoginCaptchaRequest(
    mobile: json["mobile"],
    area: json["area"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "area": area,
    "code": code,
  };
}
