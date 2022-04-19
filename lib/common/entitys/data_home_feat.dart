import 'dart:convert';
import 'dart:developer';

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

class LatestClassificationUser {
  LatestClassificationUser({
    this.id,
    this.name,
    this.sex,
    this.birth,
    this.position,
    this.company,
    this.industry,
    this.phone,
    this.email,
    this.wechat,
    this.schoolRecord,
    this.workCondition,
    this.detailMsg,
    this.description,
    this.duration,
    this.category,
    this.userType,
    this.identity,
    this.imgUrl,
    this.iconUrl,
    this.bigCoverUrl,
    this.profileImgUrl,
    this.videoUrl,
    this.password,
    this.country,
    this.address,
    this.addTime,
    this.timestamp,
  });

  factory LatestClassificationUser.fromJson(Map<String, dynamic> jsonRes) =>
      LatestClassificationUser(
        id: asT<String?>(jsonRes['_id']),
        name: asT<String?>(jsonRes['name']),
        sex: asT<String?>(jsonRes['sex']),
        birth: asT<String?>(jsonRes['birth']),
        position: asT<String?>(jsonRes['position']),
        company: asT<String?>(jsonRes['company']),
        industry: asT<String?>(jsonRes['industry']),
        phone: asT<String?>(jsonRes['phone']),
        email: asT<String?>(jsonRes['email']),
        wechat: asT<String?>(jsonRes['wechat']),
        schoolRecord: asT<String?>(jsonRes['schoolRecord']),
        workCondition: asT<String?>(jsonRes['workCondition']),
        detailMsg: asT<String?>(jsonRes['detailMsg']),
        description: asT<String?>(jsonRes['description']),
        duration: asT<String?>(jsonRes['duration']),
        category: asT<String?>(jsonRes['category']),
        userType: asT<String?>(jsonRes['userType']),
        identity: asT<String?>(jsonRes['identity']),
        imgUrl: asT<String?>(jsonRes['imgUrl']),
        iconUrl: asT<String?>(jsonRes['iconUrl']),
        bigCoverUrl: asT<String?>(jsonRes['bigCoverUrl']),
        profileImgUrl: asT<String?>(jsonRes['profileImgUrl']),
        videoUrl: asT<String?>(jsonRes['videoUrl']),
        password: asT<String?>(jsonRes['password']),
        country: asT<String?>(jsonRes['country']),
        address: asT<String?>(jsonRes['address']),
        addTime: asT<String?>(jsonRes['addTime']),
        timestamp: asT<String?>(jsonRes['timestamp']),
      );

  String? id;
  String? name;
  String? sex;
  String? birth;
  String? position;
  String? company;
  String? industry;
  String? phone;
  String? email;
  String? wechat;
  String? schoolRecord;
  String? workCondition;
  String? detailMsg;
  String? description;
  String? duration;
  String? category;
  String? userType;
  String? identity;
  String? imgUrl;
  String? iconUrl;
  String? bigCoverUrl;
  String? profileImgUrl;
  String? videoUrl;
  String? password;
  String? country;
  String? address;
  String? addTime;
  String? timestamp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'sex': sex,
        'birth': birth,
        'position': position,
        'company': company,
        'industry': industry,
        'phone': phone,
        'email': email,
        'wechat': wechat,
        'schoolRecord': schoolRecord,
        'workCondition': workCondition,
        'detailMsg': detailMsg,
        'description': description,
        'duration': duration,
        'category': category,
        'userType': userType,
        'identity': identity,
        'imgUrl': imgUrl,
        'iconUrl': iconUrl,
        'bigCoverUrl': bigCoverUrl,
        'profileImgUrl': profileImgUrl,
        'videoUrl': videoUrl,
        'password': password,
        'country': country,
        'address': address,
        'addTime': addTime,
        'timestamp': timestamp,
      };

  LatestClassificationUser clone() => LatestClassificationUser.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
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
