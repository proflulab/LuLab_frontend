import 'dart:convert';

QueryLoginOut queryLoginOutFromJson(String str) => QueryLoginOut.fromJson(json.decode(str));

String queryLoginOutToJson(QueryLoginOut data) => json.encode(data.toJson());

class QueryLoginOut {
  QueryLoginOut({
    required this.loginOut,
  });

  LoginOut loginOut;

  factory QueryLoginOut.fromJson(Map<String, dynamic> json) => QueryLoginOut(
    loginOut: LoginOut.fromJson(json["loginOut"]),
  );

  Map<String, dynamic> toJson() => {
    "loginOut": loginOut.toJson(),
  };
}

class LoginOut {
  LoginOut({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory LoginOut.fromJson(Map<String, dynamic> json) => LoginOut(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
