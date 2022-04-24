import 'dart:convert';

LatestUserCourseRecord latestUserCourseRecordFromJson(String str) =>
    LatestUserCourseRecord.fromJson(json.decode(str));

String latestUserCourseRecordToJson(LatestUserCourseRecord data) =>
    json.encode(data.toJson());

class LatestUserCourseRecord {
  LatestUserCourseRecord({
    required this.latestUserCourseRecord,
  });

  LatestUserCourseRecordClass latestUserCourseRecord;

  factory LatestUserCourseRecord.fromJson(Map<String, dynamic> json) =>
      LatestUserCourseRecord(
        latestUserCourseRecord: LatestUserCourseRecordClass.fromJson(
            json["latestUserCourseRecord"]),
      );

  Map<String, dynamic> toJson() => {
        "latestUserCourseRecord": latestUserCourseRecord.toJson(),
      };
}

class LatestUserCourseRecordClass {
  LatestUserCourseRecordClass({
    required this.msg,
    required this.status,
  });

  String msg;
  String status;

  factory LatestUserCourseRecordClass.fromJson(Map<String, dynamic> json) =>
      LatestUserCourseRecordClass(
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}

LatestUserCourseRecordRequest latestUserCourseRecordRRequestFromJson(
        String str) =>
    LatestUserCourseRecordRequest.fromJson(json.decode(str));

String latestUserCourseRecordRequestToJson(
        LatestUserCourseRecordRequest data) =>
    json.encode(data.toJson());

class LatestUserCourseRecordRequest {
  LatestUserCourseRecordRequest({
    required this.courseId,
    required this.authorId,
  });

  String courseId;
  String authorId;

  factory LatestUserCourseRecordRequest.fromJson(Map<String, dynamic> json) =>
      LatestUserCourseRecordRequest(
        courseId: json["courseId"],
        authorId: json["authorId"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "authorId": authorId,
      };
}
