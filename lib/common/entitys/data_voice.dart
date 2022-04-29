import 'dart:convert';

import 'data_course_sortdetails.dart';

// 语音 - request

VoiceRequest voiceRequestFromJson(String str) =>
    VoiceRequest.fromJson(json.decode(str));

String voiceRequestToJson(VoiceRequest data) => json.encode(data.toJson());

class VoiceRequest {
  VoiceRequest({
    required this.userId,
    required this.queryText,
  });

  final String userId;
  final String queryText;

  factory VoiceRequest.fromJson(Map<String, dynamic> json) => VoiceRequest(
        userId: json["userId"],
        queryText: json["queryText"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "queryText": queryText,
      };
}

// 语音 - response
VoiceResponse voiceResponseFromJson(String str) =>
    VoiceResponse.fromJson(json.decode(str));

String voiceResponseToJson(VoiceResponse data) => json.encode(data.toJson());

class VoiceResponse {
  VoiceResponse({
    required this.speechGoogle,
  });

  SpeechGoogle speechGoogle;

  factory VoiceResponse.fromJson(Map<String, dynamic> json) => VoiceResponse(
        speechGoogle: SpeechGoogle.fromJson(json["speechGoogle"]),
      );

  Map<String, dynamic> toJson() => {
        "speechGoogle": speechGoogle.toJson(),
      };
}

class SpeechGoogle {
  SpeechGoogle({
    required this.msg,
    required this.code,
    required this.category,
    required this.detail,
    required this.subBreak,
    required this.fields,
    this.details,
  });

  String msg;
  String code;
  String category;
  String detail;
  LatestDirectCourseElement? details;
  List<dynamic> subBreak;
  List<dynamic> fields;

  factory SpeechGoogle.fromJson(Map<String, dynamic> json) => SpeechGoogle(
        msg: json["msg"],
        code: json["code"],
        category: json["category"],
        detail: json["detail"],
        details: json["details"] == null
            ? null
            : LatestDirectCourseElement.fromJson(json["details"]),
        subBreak: List<dynamic>.from(json["subBreak"].map((x) => x)),
        fields: List<dynamic>.from(json["fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "category": category,
        "detail": detail,
        "details": details,
        "subBreak": List<dynamic>.from(subBreak.map((x) => x)),
        "fields": List<dynamic>.from(fields.map((x) => x)),
      };
}
