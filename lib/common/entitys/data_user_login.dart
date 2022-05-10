import 'dart:convert';

import 'data_home_feat.dart';

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
    required this.token,
    required this.data,
  });

  final String status;
  final String msg;
  final String token;
  final Data data;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.birth,
    this.sex,
    this.position,
    this.company,
    this.industry,
    this.country,
    this.phone,
    this.email,
    this.wechat,
    this.schoolRecord,
    this.workCondition,
    this.detailMsg,
    this.description,
    this.duration,
    this.address,
    this.category,
    this.userType,
    this.identity,
    this.imgUrl,
    this.iconUrl,
    this.bigCoverUrl,
    this.videoUrl,
    this.password,
    this.addTime,
    this.timestamp,
    this.profileImgUrl,
    this.tags,
    this.homeTown,
    this.location,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? tags = jsonRes['tags'] is List ? <String>[] : null;
    if (tags != null) {
      for (final dynamic item in jsonRes['tags']!) {
        if (item != null) {
          tags.add(asT<String>(item)!);
        }
      }
    }

    final List<String>? homeTown =
        jsonRes['homeTown'] is List ? <String>[] : null;
    if (homeTown != null) {
      for (final dynamic item in jsonRes['homeTown']!) {
        if (item != null) {
          homeTown.add(asT<String>(item)!);
        }
      }
    }

    final List<String>? location =
        jsonRes['location'] is List ? <String>[] : null;
    if (location != null) {
      for (final dynamic item in jsonRes['location']!) {
        if (item != null) {
          location.add(asT<String>(item)!);
        }
      }
    }
    return Data(
      id: asT<String?>(jsonRes['_id']),
      name: asT<String?>(jsonRes['name']),
      birth: asT<String?>(jsonRes['birth']),
      sex: asT<String?>(jsonRes['sex']),
      position: asT<String?>(jsonRes['position']),
      company: asT<String?>(jsonRes['company']),
      industry: asT<String?>(jsonRes['industry']),
      country: asT<String?>(jsonRes['country']),
      phone: asT<String?>(jsonRes['phone']),
      email: asT<String?>(jsonRes['email']),
      wechat: asT<String?>(jsonRes['wechat']),
      schoolRecord: asT<String?>(jsonRes['schoolRecord']),
      workCondition: asT<String?>(jsonRes['workCondition']),
      detailMsg: asT<String?>(jsonRes['detailMsg']),
      description: asT<String?>(jsonRes['description']),
      duration: asT<String?>(jsonRes['duration']),
      address: asT<String?>(jsonRes['address']),
      category: asT<String?>(jsonRes['category']),
      userType: asT<String?>(jsonRes['userType']),
      identity: asT<String?>(jsonRes['identity']),
      imgUrl: asT<String?>(jsonRes['imgUrl']),
      iconUrl: asT<String?>(jsonRes['iconUrl']),
      bigCoverUrl: asT<String?>(jsonRes['bigCoverUrl']),
      videoUrl: asT<String?>(jsonRes['videoUrl']),
      password: asT<String?>(jsonRes['password']),
      addTime: asT<String?>(jsonRes['addTime']),
      timestamp: asT<String?>(jsonRes['timestamp']),
      profileImgUrl: asT<String?>(jsonRes['profileImgUrl']),
      tags: tags,
      homeTown: homeTown,
      location: location,
    );
  }

  String? id;
  String? name;
  String? birth;
  String? sex;
  String? position;
  String? company;
  String? industry;
  String? country;
  String? phone;
  String? email;
  String? wechat;
  String? schoolRecord;
  String? workCondition;
  String? detailMsg;
  String? description;
  String? duration;
  String? address;
  String? category;
  String? userType;
  String? identity;
  String? imgUrl;
  String? iconUrl;
  String? bigCoverUrl;
  String? videoUrl;
  String? password;
  String? addTime;
  String? timestamp;
  String? profileImgUrl;
  List<String>? tags;
  List<String>? homeTown;
  List<String>? location;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'birth': birth,
        'sex': sex,
        'position': position,
        'company': company,
        'industry': industry,
        'country': country,
        'phone': phone,
        'email': email,
        'wechat': wechat,
        'schoolRecord': schoolRecord,
        'workCondition': workCondition,
        'detailMsg': detailMsg,
        'description': description,
        'duration': duration,
        'address': address,
        'category': category,
        'userType': userType,
        'identity': identity,
        'imgUrl': imgUrl,
        'iconUrl': iconUrl,
        'bigCoverUrl': bigCoverUrl,
        'videoUrl': videoUrl,
        'password': password,
        'addTime': addTime,
        'timestamp': timestamp,
        'profileImgUrl': profileImgUrl,
        'tags': tags,
        'homeTown': homeTown,
        'location': location,
      };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
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

class QuickLoginrequest {
  QuickLoginrequest({
    required this.token,
    required this.accessToken,
  });

  final String token;
  final String accessToken;

  factory QuickLoginrequest.fromJson(Map<String, dynamic> json) =>
      QuickLoginrequest(
        token: json["token"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "accessToken": accessToken,
      };
}
