// To parse this JSON data, do
//
//     final registered = registeredFromJson(jsonString);

import 'dart:convert';

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
