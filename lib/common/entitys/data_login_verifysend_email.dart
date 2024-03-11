// To parse this JSON data, do
//
//     final queryVerifySend = queryVerifySendFromJson(jsonString);

import 'dart:convert';

QueryVerifySendEmail queryVerifySendEmailFromJson(String str) =>
    QueryVerifySendEmail.fromJson(json.decode(str));

String queryVerifySendEmailToJson(QueryVerifySendEmail data) =>
    json.encode(data.toJson());

class QueryVerifySendEmail {
  QueryVerifySendEmail({
    required this.verifySendEmail,
  });

  VerifySendEmail verifySendEmail;

  factory QueryVerifySendEmail.fromJson(Map<String, dynamic> json) =>
      QueryVerifySendEmail(
        verifySendEmail: VerifySendEmail.fromJson(json["verifySend"]),
      );

  Map<String, dynamic> toJson() => {
        "verifySend": verifySendEmail.toJson(),
      };
}

class VerifySendEmail {
  VerifySendEmail({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory VerifySendEmail.fromJson(Map<String, dynamic> json) =>
      VerifySendEmail(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

VerifySendRequestEmail verifySendRequestEmailFromJson(String str) =>
    VerifySendRequestEmail.fromJson(json.decode(str));

String verifySendRequestEmailToJson(VerifySendRequestEmail data) =>
    json.encode(data.toJson());

class VerifySendRequestEmail {
  VerifySendRequestEmail({
    required this.email,
  });

  String email;

  factory VerifySendRequestEmail.fromJson(Map<String, dynamic> json) =>
      VerifySendRequestEmail(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
