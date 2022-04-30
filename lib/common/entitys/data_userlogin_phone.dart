import 'dart:convert';

//城市区号列表
Phoneresponse phoneresponseFromJson(String str) =>
    Phoneresponse.fromJson(json.decode(str));

String phoneresponseToJson(Phoneresponse data) => json.encode(data.toJson());

class Phoneresponse {
  Phoneresponse({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final List<Datum> data;

  factory Phoneresponse.fromJson(Map<String, dynamic> json) => Phoneresponse(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.listData,
    required this.name,
  });

  final List<ListDatum> listData;
  final String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        listData: List<ListDatum>.from(
            json["listData"].map((x) => ListDatum.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "listData": List<dynamic>.from(listData.map((x) => x.toJson())),
        "name": name,
      };
}

class ListDatum {
  ListDatum({
    required this.id,
    required this.groupCode,
    required this.code,
    required this.name,
  });

  final int id;
  final String groupCode;
  final String code;
  final String name;

  factory ListDatum.fromJson(Map<String, dynamic> json) => ListDatum(
        id: json["id"],
        groupCode: json["groupCode"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "groupCode": groupCode,
        "code": code,
        "name": name,
      };
}
