import 'dart:convert';

Loginresponse loginresponseFromJson(String str) =>
    Loginresponse.fromJson(json.decode(str));

String loginresponseToJson(Loginresponse data) => json.encode(data.toJson());

class Loginresponse {
  Loginresponse({
    required this.userLogin,
  });

  final UserLogin userLogin;

  factory Loginresponse.fromJson(Map<String, dynamic> json) => Loginresponse(
        userLogin: UserLogin.fromJson(json["userLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "userLogin": userLogin.toJson(),
      };
}

class UserLogin {
  UserLogin({
    required this.status,
    required this.msg,
    required this.data,
  });

  final String status;
  final String msg;
  final Data data;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.age,
    required this.sex,
    required this.position,
    required this.industry,
    required this.country,
    required this.phone,
    required this.email,
    required this.wechat,
    required this.schoolRecord,
    required this.workCondition,
    required this.detailMsg,
    required this.description,
    required this.category,
    required this.userType,
    required this.identity,
    required this.imgUrl,
    required this.iconUrl,
    required this.bigCoverUrl,
    required this.password,
    required this.videos,
    required this.imgs,
    required this.docs,
    required this.growthDescriptions,
    required this.tags,
  });

  final String id;
  final String name;
  final String age;
  final String sex;
  final String position;
  final String industry;
  final String country;
  final String phone;
  final String email;
  final String wechat;
  final String schoolRecord;
  final String workCondition;
  final String detailMsg;
  final String description;
  final String category;
  final String userType;
  final String identity;
  final String imgUrl;
  final String iconUrl;
  final String bigCoverUrl;
  final String password;
  final List<String> videos;
  final List<String> imgs;
  final List<String> docs;
  final List<String> growthDescriptions;
  final List<String> tags;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        age: json["age"],
        sex: json["sex"],
        position: json["position"],
        industry: json["industry"],
        country: json["country"],
        phone: json["phone"],
        email: json["email"],
        wechat: json["wechat"],
        schoolRecord: json["schoolRecord"],
        workCondition: json["workCondition"],
        detailMsg: json["detailMsg"],
        description: json["description"],
        category: json["category"],
        userType: json["userType"],
        identity: json["identity"],
        imgUrl: json["imgUrl"],
        iconUrl: json["iconUrl"],
        bigCoverUrl: json["bigCoverUrl"],
        password: json["password"],
        videos: List<String>.from(json["videos"].map((x) => x)),
        imgs: List<String>.from(json["imgs"].map((x) => x)),
        docs: List<String>.from(json["docs"].map((x) => x)),
        growthDescriptions:
            List<String>.from(json["growthDescriptions"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "age": age,
        "sex": sex,
        "position": position,
        "industry": industry,
        "country": country,
        "phone": phone,
        "email": email,
        "wechat": wechat,
        "schoolRecord": schoolRecord,
        "workCondition": workCondition,
        "detailMsg": detailMsg,
        "description": description,
        "category": category,
        "userType": userType,
        "identity": identity,
        "imgUrl": imgUrl,
        "iconUrl": iconUrl,
        "bigCoverUrl": bigCoverUrl,
        "password": password,
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "imgs": List<dynamic>.from(imgs.map((x) => x)),
        "docs": List<dynamic>.from(docs.map((x) => x)),
        "growthDescriptions":
            List<dynamic>.from(growthDescriptions.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

// 用户登录 - request
Loginrequest loginrequestFromJson(String str) =>
    Loginrequest.fromJson(json.decode(str));

String loginrequestToJson(Loginrequest data) => json.encode(data.toJson());

class Loginrequest {
  Loginrequest({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory Loginrequest.fromJson(Map<String, dynamic> json) => Loginrequest(
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
      };
}
