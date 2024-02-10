// To parse this JSON data, do
//
//     final queryVerifySend = queryVerifySendFromJson(jsonString);

import 'dart:convert';

QueryVerifySend_email queryVerifySend_emailFromJson(String str) =>
    QueryVerifySend_email.fromJson(json.decode(str));

String queryVerifySend_emailToJson(QueryVerifySend_email data) =>
    json.encode(data.toJson());

class QueryVerifySend_email {
  QueryVerifySend_email({
    required this.verifySend_email,
  });

  VerifySend_email verifySend_email;

  factory QueryVerifySend_email.fromJson(Map<String, dynamic> json) =>
      QueryVerifySend_email(
        verifySend_email: VerifySend_email.fromJson(json["verifySend"]),
      );

  Map<String, dynamic> toJson() => {
        "verifySend": verifySend_email.toJson(),
      };
}

class VerifySend_email {
  VerifySend_email({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory VerifySend_email.fromJson(Map<String, dynamic> json) =>
      VerifySend_email(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

VerifySendRequest_email verifySendRequest_emailFromJson(String str) =>
    VerifySendRequest_email.fromJson(json.decode(str));

String verifySendRequest_emailToJson(VerifySendRequest_email data) =>
    json.encode(data.toJson());

class VerifySendRequest_email {
  VerifySendRequest_email({
    required this.email,
  });

  String email;

  factory VerifySendRequest_email.fromJson(Map<String, dynamic> json) =>
      VerifySendRequest_email(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
