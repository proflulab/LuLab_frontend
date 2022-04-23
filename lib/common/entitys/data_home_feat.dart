import 'dart:convert';
import 'dart:developer';

class FFConvert {
  FFConvert._();
  // ignore: prefer_function_declarations_over_variables
  static T? Function<T extends Object?>(dynamic value) convert =
      <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

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
    required this.birth,
    required this.sex,
    required this.phone,
    required this.email,
    required this.wechat,
    required this.homeTown,
    required this.location,
    required this.detailMsg,
    required this.description,
    required this.imgUrl,
    required this.profileImgUrl,
    required this.bigCoverUrl,
    required this.videoUrl,
    required this.tags,
    required this.category,
    required this.userType,
  });

  final String id;
  final String name;
  final String birth;
  final String sex;
  final String phone;
  final String email;
  final String wechat;
  final List<String> homeTown;
  final List<String> location;
  final String detailMsg;
  final String description;
  final String imgUrl;
  final String profileImgUrl;
  final String bigCoverUrl;
  final String videoUrl;
  final List<String> tags;
  final String category;
  final String userType;

  factory LatestClassificationUser.fromJson(Map<String, dynamic> json) =>
      LatestClassificationUser(
        id: json["_id"],
        name: json["name"],
        birth: json["birth"],
        sex: json["sex"],
        phone: json["phone"],
        email: json["email"],
        wechat: json["wechat"],
        homeTown: List<String>.from(json["homeTown"].map((x) => x)),
        location: List<String>.from(json["location"].map((x) => x)),
        detailMsg: json["detailMsg"],
        description: json["description"],
        imgUrl: json["imgUrl"],
        profileImgUrl: json["profileImgUrl"],
        bigCoverUrl: json["bigCoverUrl"],
        videoUrl: json["videoUrl"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        category: json["category"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "birth": birth,
        "sex": sex,
        "phone": phone,
        "email": email,
        "wechat": wechat,
        "homeTown": List<dynamic>.from(homeTown.map((x) => x)),
        "location": List<dynamic>.from(location.map((x) => x)),
        "detailMsg": detailMsg,
        "description": description,
        "imgUrl": imgUrl,
        "profileImgUrl": profileImgUrl,
        "bigCoverUrl": bigCoverUrl,
        "videoUrl": videoUrl,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "category": category,
        "userType": userType,
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
