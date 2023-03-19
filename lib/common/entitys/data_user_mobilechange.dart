// To parse this JSON data, do
//
//     final queryMobileChange = queryMobileChangeFromJson(jsonString);

import 'dart:convert';

QueryMobileChange queryMobileChangeFromJson(String str) => QueryMobileChange.fromJson(json.decode(str));

String queryMobileChangeToJson(QueryMobileChange data) => json.encode(data.toJson());

class QueryMobileChange {
  QueryMobileChange({
    required this.mobileChange,
  });

  MobileChange mobileChange;

  factory QueryMobileChange.fromJson(Map<String, dynamic> json) => QueryMobileChange(
    mobileChange: MobileChange.fromJson(json["mobileChange"]),
  );

  Map<String, dynamic> toJson() => {
    "mobileChange": mobileChange.toJson(),
  };
}

class MobileChange {
  MobileChange({
    required this.username,
    required this.imageUrl,
    required this.mobile,
  });

  String username;
  String imageUrl;
  String mobile;

  factory MobileChange.fromJson(Map<String, dynamic> json) => MobileChange(
    username: json["username"],
    imageUrl: json["imageUrl"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "imageUrl": imageUrl,
    "mobile": mobile,
  };
}
MobileChangeRequest mobileChangeRequestFromJson(String str) => MobileChangeRequest.fromJson(json.decode(str));

String mobileChangeRequestToJson(MobileChangeRequest data) => json.encode(data.toJson());

class MobileChangeRequest {
  MobileChangeRequest({
    required this.mobile,
    required this.area,
    required this.code,
  });

  String mobile;
  int area;
  String code;

  factory MobileChangeRequest.fromJson(Map<String, dynamic> json) => MobileChangeRequest(
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
