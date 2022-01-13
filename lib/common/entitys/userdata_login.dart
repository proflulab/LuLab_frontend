import 'dart:convert';

// 用户登录 - response

Loginresponse loginresponseFromJson(String str) =>
    Loginresponse.fromJson(json.decode(str));

String loginresponseToJson(Loginresponse data) => json.encode(data.toJson());

class Loginresponse {
  Loginresponse({
    required this.userLogin,
  });

  final UserLogin userLogin;

  factory Loginresponse.fromJson(Map<String, dynamic> json) => Loginresponse(
        userLogin: UserLogin.fromJson(json['userLogin']),
      );

  Map<String, dynamic> toJson() => {
        "userLogin": userLogin.toJson(),
      };
}

class UserLogin {
  UserLogin({
    required this.status,
    required this.msg,
    required this.data,
  });

  final String status;
  final String msg;
  final Data data;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.password,
    required this.img,
    required this.wechat,
    required this.phone,
    required this.sex,
    required this.description,
  });

  final String name;
  final String password;
  final String img;
  final String wechat;
  final String phone;
  final String sex;
  final dynamic description;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        password: json["password"],
        img: json["img"] ?? "",
        wechat: json["wechat"] ?? "",
        phone: json["phone"] ?? "",
        sex: json["sex"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "img": img,
        "wechat": wechat,
        "phone": phone,
        "sex": sex,
        "description": description,
      };
}

// 用户登录 - request
Loginrequest loginrequestFromJson(String str) =>
    Loginrequest.fromJson(json.decode(str));

String loginrequestToJson(Loginrequest data) => json.encode(data.toJson());

class Loginrequest {
  Loginrequest({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory Loginrequest.fromJson(Map<String, dynamic> json) => Loginrequest(
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
      };
}
