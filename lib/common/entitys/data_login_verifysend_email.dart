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
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory VerifySendEmail.fromJson(Map<String, dynamic> json) =>
      VerifySendEmail(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
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
