// To parse this JSON data, do
//
//     final queryVerifySend = queryVerifySendFromJson(jsonString);

import 'dart:convert';

QueryVerifySend queryVerifySendFromJson(String str) =>
    QueryVerifySend.fromJson(json.decode(str));

String queryVerifySendToJson(QueryVerifySend data) =>
    json.encode(data.toJson());

class QueryVerifySend {
  QueryVerifySend({
    required this.verifySend,
  });

  VerifySend verifySend;

  factory QueryVerifySend.fromJson(Map<String, dynamic> json) =>
      QueryVerifySend(
        verifySend: VerifySend.fromJson(json["verifySend"]),
      );

  Map<String, dynamic> toJson() => {
        "verifySend": verifySend.toJson(),
      };
}

class VerifySend {
  VerifySend({
    this.status,
    required this.msg,
  });

  dynamic status;
  String msg;

  factory VerifySend.fromJson(Map<String, dynamic> json) => VerifySend(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

VerifySendRequest verifySendRequestFromJson(String str) =>
    VerifySendRequest.fromJson(json.decode(str));

String verifySendRequestToJson(VerifySendRequest data) =>
    json.encode(data.toJson());

class VerifySendRequest {
  VerifySendRequest({
    required this.mobile,
    required this.area,
  });

  String mobile;
  int area;

  factory VerifySendRequest.fromJson(Map<String, dynamic> json) =>
      VerifySendRequest(
        mobile: json["mobile"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "area": area,
      };
}
