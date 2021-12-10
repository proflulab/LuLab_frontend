import 'dart:convert';

// 更新用户数据 - response
UserUpdateresponse userUpdateresponseFromJson(String str) =>
    UserUpdateresponse.fromJson(json.decode(str));

String userUpdateresponseToJson(UserUpdateresponse data) =>
    json.encode(data.toJson());

class UserUpdateresponse {
  UserUpdateresponse({
    required this.userUpdate,
  });

  final UserUpdate userUpdate;

  factory UserUpdateresponse.fromJson(Map<String, dynamic> json) =>
      UserUpdateresponse(
        userUpdate: UserUpdate.fromJson(json["userUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "userUpdate": userUpdate.toJson(),
      };
}

class UserUpdate {
  UserUpdate({
    required this.msg,
    required this.status,
  });

  final String msg;
  final String status;

  factory UserUpdate.fromJson(Map<String, dynamic> json) => UserUpdate(
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}

// 更新用户数据 - request
UserUpdaterequest userUpdaterequestFromJson(String str) =>
    UserUpdaterequest.fromJson(json.decode(str));

String userUpdaterequestToJson(UserUpdaterequest data) =>
    json.encode(data.toJson());

class UserUpdaterequest {
  UserUpdaterequest({
    required this.name,
    required this.password,
    required this.sex,
    required this.img,
    required this.description,
  });

  final String name;
  final String password;
  final String sex;
  final String img;
  final String description;

  factory UserUpdaterequest.fromJson(Map<String, dynamic> json) =>
      UserUpdaterequest(
        name: json["name"],
        password: json["password"],
        sex: json["sex"],
        img: json["img"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "sex": sex,
        "img": img,
        "description": description,
      };
}
