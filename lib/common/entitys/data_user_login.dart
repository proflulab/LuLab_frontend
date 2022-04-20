import 'dart:convert';

Loginresponse loginresponseFromJson(String str) =>
    Loginresponse.fromJson(json.decode(str));

String loginresponseToJson(Loginresponse data) => json.encode(data.toJson());

class Loginresponse {
  Loginresponse({
    required this.userLogin,
  });

  final UserLogin userLogin;

  factory Loginresponse.fromJson(Map<String, dynamic> json) => Loginresponse(
        userLogin: UserLogin.fromJson(json["userLogin"]),
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
    required this.id,
    required this.name,
    required this.birth,
    required this.sex,
    required this.industry,
    required this.phone,
    required this.email,
    required this.wechat,
    required this.description,
    required this.profileImgUrl,
    required this.password,
  });

  final String id;
  final String name;
  final String birth;
  final String sex;
  final String industry;
  final String phone;
  final String email;
  final String wechat;
  final String description;
  final String profileImgUrl;
  final String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        birth: json["birth"]??"",
        sex: json["sex"] ?? "",
        industry: json["industry"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        wechat: json["wechat"] ?? "",
        description: json["description"] ?? "",
        profileImgUrl: json["profileImgUrl"] ?? "",
        password: json["password"] ,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "birth": birth,
        "sex": sex,
        "industry": industry,
        "phone": phone,
        "email": email,
        "wechat": wechat,
        "description": description,
        "profileImgUrl": profileImgUrl,
        "password": password,
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
