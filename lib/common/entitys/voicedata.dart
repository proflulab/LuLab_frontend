import 'dart:convert';

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
        userId: json["userId"] as String,
        queryText: json["queryText"] as String,
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
    required this.data,
  });

  final VoiceData data;

  factory VoiceResponse.fromJson(Map<String, dynamic> json) => VoiceResponse(
        data: VoiceData.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class VoiceData {
  VoiceData({
    required this.speechGoogle,
  });

  final SpeechGoogle speechGoogle;

  factory VoiceData.fromJson(Map<String, dynamic> json) => VoiceData(
        speechGoogle: SpeechGoogle.fromJson(json["speechGoogle"]),
      );

  Map<String, dynamic> toJson() => {
        "speechGoogle": speechGoogle.toJson(),
      };
}

class SpeechGoogle {
  SpeechGoogle({
    required this.msg,
    required this.status,
  });

  final String msg;
  final String status;

  factory SpeechGoogle.fromJson(Map<String, dynamic> json) => SpeechGoogle(
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}
