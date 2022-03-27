import 'dart:convert';

Feats featsFromJson(String str) => Feats.fromJson(json.decode(str));

String featsToJson(Feats data) => json.encode(data.toJson());

class Feats {
  Feats({
    required this.latestClassificationUser,
  });

  final List<LatestClassificationUser> latestClassificationUser;

  factory Feats.fromJson(Map<String, dynamic> json) => Feats(
        latestClassificationUser: List<LatestClassificationUser>.from(
            json["latestClassificationUser"]
                .map((x) => LatestClassificationUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestClassificationUser":
            List<dynamic>.from(latestClassificationUser.map((x) => x.toJson())),
      };
}

class LatestClassificationUser {
  LatestClassificationUser({
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

  factory LatestClassificationUser.fromJson(Map<String, dynamic> json) =>
      LatestClassificationUser(
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

//request
FeatsRequest featsRequestFromJson(String str) =>
    FeatsRequest.fromJson(json.decode(str));

String featsRequestToJson(FeatsRequest data) => json.encode(data.toJson());

class FeatsRequest {
  FeatsRequest({
    required this.category,
    required this.skip,
    required this.limit,
  });

  final String category;
  final int skip;
  final int limit;

  factory FeatsRequest.fromJson(Map<String, dynamic> json) => FeatsRequest(
        category: json["category"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "skip": skip,
        "limit": limit,
      };
}
