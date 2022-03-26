import 'dart:convert';

RecordAdd recordAddFromJson(String str) => RecordAdd.fromJson(json.decode(str));

String recordAddToJson(RecordAdd data) => json.encode(data.toJson());

class RecordAdd {
  RecordAdd({
    required this.recordAdd,
  });

  RecordAddClass recordAdd;

  factory RecordAdd.fromJson(Map<String, dynamic> json) => RecordAdd(
        recordAdd: RecordAddClass.fromJson(json["recordAdd"]),
      );

  Map<String, dynamic> toJson() => {
        "recordAdd": recordAdd.toJson(),
      };
}

class RecordAddClass {
  RecordAddClass({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory RecordAddClass.fromJson(Map<String, dynamic> json) => RecordAddClass(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

//请求数据
RecordAddRequest recordAddRequestFromJson(String str) =>
    RecordAddRequest.fromJson(json.decode(str));

String recordAddRequestToJson(RecordAddRequest data) =>
    json.encode(data.toJson());

class RecordAddRequest {
  RecordAddRequest({
    required this.courseId,
    required this.authorId,
    required this.status,
    required this.onlineTime,
  });

  String courseId;
  String authorId;
  String status;
  DateTime onlineTime;

  factory RecordAddRequest.fromJson(Map<String, dynamic> json) =>
      RecordAddRequest(
        courseId: json["courseId"],
        authorId: json["authorId"],
        status: json["status"],
        onlineTime: DateTime.parse(json["onlineTime"]),
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "authorId": authorId,
        "status": status,
        "onlineTime": onlineTime.toIso8601String(),
      };
}
