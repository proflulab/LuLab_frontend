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
    required this.id,
    required this.name,
    required this.sex,
    required this.description,
    required this.wechat,
    required this.phone,
  });

  final String id;
  final String name;
  final String sex;
  final String description;
  final String wechat;
  final String phone;

  factory UserUpdaterequest.fromJson(Map<String, dynamic> json) =>
      UserUpdaterequest(
        id: json["_id"],
        name: json["name"],
        sex: json["sex"],
        description: json["description"],
        wechat: json["wechat"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "sex": sex,
        "description": description,
        "wechat": wechat,
        "phone": phone,
      };
}
