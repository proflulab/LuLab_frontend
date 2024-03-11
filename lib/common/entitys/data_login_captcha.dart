// // To parse this JSON data, do
// //
// //     final queryLoginCaptcha = queryLoginCaptchaFromJson(jsonString);

// import 'dart:convert';

// QueryLoginCaptcha queryLoginCaptchaFromJson(String str) => QueryLoginCaptcha.fromJson(json.decode(str));

// String queryLoginCaptchaToJson(QueryLoginCaptcha data) => json.encode(data.toJson());

// class QueryLoginCaptcha {
//   QueryLoginCaptcha({
//     required this.loginCaptcha,
//   });

//   LoginCaptcha loginCaptcha;

//   factory QueryLoginCaptcha.fromJson(Map<String, dynamic> json) => QueryLoginCaptcha(
//     loginCaptcha: LoginCaptcha.fromJson(json["loginCaptcha"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "loginCaptcha": loginCaptcha.toJson(),
//   };
// }

// class LoginCaptcha {
//   LoginCaptcha({
//     required this.status,
//     required this.msg,
//     required this.token,
//     required this.refreshToken,
//     required this.data,
//   });

//   String status;
//   String msg;
//   String token;
//   String refreshToken;
//   Data data;

//   factory LoginCaptcha.fromJson(Map<String, dynamic> json) => LoginCaptcha(
//     status: json["status"],
//     msg: json["msg"],
//     token: json["token"],
//     refreshToken: json["refresh_token"],
//     data: Data.fromJson(json["data"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "msg": msg,
//     "token": token,
//     "refresh_token": refreshToken,
//     "data": data.toJson(),
//   };
// }

// class Data {
//   Data({
//     this.username,
//     this.profilePicture,
//     this.sex,
//     this.mobile,
//     this.wechat,
//     this.dsc,
//   });

//   String? username;
//   String? profilePicture;
//   int? sex;
//   String? mobile;
//   String? wechat;
//   String? dsc;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     username: json["username"],
//     profilePicture: json["profile_picture"],
//     sex: json["sex"],
//     mobile: json["mobile"],
//     wechat: json["wechat"],
//     dsc: json["dsc"],
//   );

//   Map<String, dynamic> toJson() => {
//     "username": username,
//     "profile_picture": profilePicture,
//     "sex": sex,
//     "mobile": mobile,
//     "wechat": wechat,
//     "dsc": dsc,
//   };
// }



// LoginCaptchaRequest loginCaptchaRequestFromJson(String str) => LoginCaptchaRequest.fromJson(json.decode(str));

// String loginCaptchaRequestToJson(LoginCaptchaRequest data) => json.encode(data.toJson());

// class LoginCaptchaRequest {
//   LoginCaptchaRequest({
//     required this.mobile,
//     required this.area,
//     required this.code,
//   });

//   String mobile;
//   int area;
//   String code;

//   factory LoginCaptchaRequest.fromJson(Map<String, dynamic> json) => LoginCaptchaRequest(
//     mobile: json["mobile"],
//     area: json["area"],
//     code: json["code"],
//   );

//   Map<String, dynamic> toJson() => {
//     "mobile": mobile,
//     "area": area,
//     "code": code,
//   };
// }
