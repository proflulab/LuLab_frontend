import 'dart:convert';

// 注册新用户 - response
Registered registeredFromJson(String str) =>
    Registered.fromJson(json.decode(str));

String registeredToJson(Registered data) => json.encode(data.toJson());

class Registered {
  Registered({
    required this.userRigister,
  });

  final UserRigister userRigister;

  factory Registered.fromJson(Map<String, dynamic> json) => Registered(
        userRigister: UserRigister.fromJson(json["userRigister"]),
      );

  Map<String, dynamic> toJson() => {
        "userRigister": userRigister.toJson(),
      };
}

class UserRigister {
  UserRigister({
    required this.msg,
    required this.status,
  });

  final String msg;
  final String status;

  factory UserRigister.fromJson(Map<String, dynamic> json) => UserRigister(
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}

// 用户登录 - request
Registeredrequest registeredrequestFromJson(String str) =>
    Registeredrequest.fromJson(json.decode(str));

String registeredrequestToJson(Registeredrequest data) =>
    json.encode(data.toJson());

class Registeredrequest {
  Registeredrequest({
    required this.name,
    required this.password,
    required this.ensurePassword,
  });

  final String name;
  final String password;
  final String ensurePassword;

  factory Registeredrequest.fromJson(Map<String, dynamic> json) =>
      Registeredrequest(
        name: json["name"],
        password: json["password"],
        ensurePassword: json["ensurePassword"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "ensurePassword": ensurePassword,
      };
}
