import 'dart:convert';

QueryVerifyCheck_email queryVerifyCheckFromJson(String str) =>
    QueryVerifyCheck_email.fromJson(json.decode(str));

String queryVerifyCheckToJson(QueryVerifyCheck_email data) =>
    json.encode(data.toJson());

class QueryVerifyCheck_email {
  QueryVerifyCheck_email({
    required this.verifyCheck,
  });

  VerifyCheck_email verifyCheck;

  factory QueryVerifyCheck_email.fromJson(Map<String, dynamic> json) =>
      QueryVerifyCheck_email(
        verifyCheck: VerifyCheck_email.fromJson(json["verifyCheck"]),
      );

  Map<String, dynamic> toJson() => {
        "verifyCheck": verifyCheck.toJson(),
      };
}

class VerifyCheck_email {
  VerifyCheck_email({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory VerifyCheck_email.fromJson(Map<String, dynamic> json) =>
      VerifyCheck_email(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

VerifyCheckRequest_email verifyCheckRequestFromJson(String str) =>
    VerifyCheckRequest_email.fromJson(json.decode(str));

String verifyCheckRequestToJson(VerifyCheckRequest_email data) =>
    json.encode(data.toJson());

class VerifyCheckRequest_email {
  VerifyCheckRequest_email({
    required this.mobile,
    required this.area,
    required this.code,
  });

  String mobile;
  int area;
  String code;

  factory VerifyCheckRequest_email.fromJson(Map<String, dynamic> json) =>
      VerifyCheckRequest_email(
        mobile: json["mobile"],
        area: json["area"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "area": area,
        "code": code,
      };
}
