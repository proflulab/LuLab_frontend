import 'dart:convert';

QueryVerifyCheck queryVerifyCheckFromJson(String str) => QueryVerifyCheck.fromJson(json.decode(str));

String queryVerifyCheckToJson(QueryVerifyCheck data) => json.encode(data.toJson());

class QueryVerifyCheck {
  QueryVerifyCheck({
    required this.verifyCheck,
  });

  VerifyCheck verifyCheck;

  factory QueryVerifyCheck.fromJson(Map<String, dynamic> json) => QueryVerifyCheck(
    verifyCheck: VerifyCheck.fromJson(json["verifyCheck"]),
  );

  Map<String, dynamic> toJson() => {
    "verifyCheck": verifyCheck.toJson(),
  };
}

class VerifyCheck {
  VerifyCheck({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory VerifyCheck.fromJson(Map<String, dynamic> json) => VerifyCheck(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}

VerifyCheckRequest verifyCheckRequestFromJson(String str) => VerifyCheckRequest.fromJson(json.decode(str));

String verifyCheckRequestToJson(VerifyCheckRequest data) => json.encode(data.toJson());

class VerifyCheckRequest {
  VerifyCheckRequest({
    required this.mobile,
    required this.area,
    required this.code,
  });

  String mobile;
  int area;
  String code;

  factory VerifyCheckRequest.fromJson(Map<String, dynamic> json) => VerifyCheckRequest(
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
