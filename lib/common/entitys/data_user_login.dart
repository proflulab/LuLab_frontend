import 'dart:convert';

//import 'data_home_feat.dart';

class Loginresponse {
  UserLogin? userLogin;

  Loginresponse({this.userLogin});

  Loginresponse.fromJson(Map<String, dynamic> json) {
    userLogin = json['userLogin'] != null
        ? UserLogin.fromJson(json['userLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userLogin != null) {
      data['userLogin'] = userLogin!.toJson();
    }
    return data;
  }
}

class UserLogin {
  String? status;
  String? msg;
  String? token;
  Data? data;

  UserLogin({this.status, this.msg, this.token, this.data});

  UserLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? sex;
  String? password;
  String? birth;
  String? position;
  String? industry;
  String? phone;
  String? email;
  String? wechat;
  String? detailMsg;
  String? description;
  String? duration;
  String? userType;
  String? identity;
  String? imgUrl;
  String? iconUrl;
  String? bigCoverUrl;
  String? profileImgUrl;
  String? videoUrl;

  Data(
      {this.id,
      this.name,
      this.sex,
      this.password,
      this.birth,
      this.position,
      this.industry,
      this.phone,
      this.email,
      this.wechat,
      this.detailMsg,
      this.description,
      this.duration,
      this.userType,
      this.identity,
      this.imgUrl,
      this.iconUrl,
      this.bigCoverUrl,
      this.profileImgUrl,
      this.videoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    sex = json['sex'];
    password = json['password'];
    birth = json['birth'];
    position = json['position'];
    industry = json['industry'];
    phone = json['phone'];
    email = json['email'];
    wechat = json['wechat'];
    detailMsg = json['detailMsg'];
    description = json['description'];
    duration = json['duration'];
    userType = json['userType'];
    identity = json['identity'];
    imgUrl = json['imgUrl'];
    iconUrl = json['iconUrl'];
    bigCoverUrl = json['bigCoverUrl'];
    profileImgUrl = json['profileImgUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['sex'] = sex;
    data['password'] = password;
    data['birth'] = birth;
    data['position'] = position;
    data['industry'] = industry;
    data['phone'] = phone;
    data['email'] = email;
    data['wechat'] = wechat;
    data['detailMsg'] = detailMsg;
    data['description'] = description;
    data['duration'] = duration;
    data['userType'] = userType;
    data['identity'] = identity;
    data['imgUrl'] = imgUrl;
    data['iconUrl'] = iconUrl;
    data['bigCoverUrl'] = bigCoverUrl;
    data['profileImgUrl'] = profileImgUrl;
    data['videoUrl'] = videoUrl;
    return data;
  }
}

// 用户账号密码登录request
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

//验证码响应
VerificationCodeRes verificationCodeResFromJson(String str) =>
    VerificationCodeRes.fromJson(json.decode(str));

String verificationCodeResToJson(VerificationCodeRes data) =>
    json.encode(data.toJson());

class VerificationCodeRes {
  VerificationCodeRes({
    required this.status,
    required this.msg,
  });

  final String status;
  final String msg;

  factory VerificationCodeRes.fromJson(Map<String, dynamic> json) =>
      VerificationCodeRes(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

//验证码校验响应
CodeCheckRes codeCheckResFromJson(String str) =>
    CodeCheckRes.fromJson(json.decode(str));

String codeCheckResToJson(CodeCheckRes data) => json.encode(data.toJson());

class CodeCheckRes {
  CodeCheckRes({
    required this.msg,
    required this.status,
    required this.token,
  });

  final String msg;
  final String status;
  final String token;

  factory CodeCheckRes.fromJson(Map<String, dynamic> json) => CodeCheckRes(
        msg: json["msg"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "token": token,
      };
}

//验证码校验请求
CodeCheckReq codeCheckReqFromJson(String str) =>
    CodeCheckReq.fromJson(json.decode(str));

String codeCheckReqToJson(CodeCheckReq data) => json.encode(data.toJson());

class CodeCheckReq {
  CodeCheckReq({
    required this.mobile,
    required this.code,
  });

  final String mobile;
  final String code;

  factory CodeCheckReq.fromJson(Map<String, dynamic> json) => CodeCheckReq(
        mobile: json["mobile"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "code": code,
      };
}

//一键登录请求
class QuickLoginReq {
  QuickLoginReq({
    required this.token,
    required this.accessToken,
  });

  final String token;
  final String accessToken;

  factory QuickLoginReq.fromJson(Map<String, dynamic> json) => QuickLoginReq(
        token: json["token"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "accessToken": accessToken,
      };
}

//一键登录响应
class QuickLoginRes {
  String? msg;
  String? status;
  String? token;
  UserData? data;

  QuickLoginRes({this.msg, this.status, this.token, this.data});

  QuickLoginRes.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? sId;
  List<String>? location;
  List<String>? homeTown;
  List<String>? imgs;
  List<String>? tags;
  String? password;
  String? name;
  String? account;
  String? imgUrl;
  String? userType;
  String? addTime;
  String? timestamp;
  int? iV;

  UserData(
      {this.sId,
      this.location,
      this.homeTown,
      this.imgs,
      this.tags,
      this.password,
      this.name,
      this.account,
      this.imgUrl,
      this.userType,
      this.addTime,
      this.timestamp,
      this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'].cast<String>();
    homeTown = json['homeTown'].cast<String>();
    imgs = json['imgs'].cast<String>();
    tags = json['tags'].cast<String>();
    password = json['password'];
    name = json['name'];
    account = json['account'];
    imgUrl = json['imgUrl'];
    userType = json['userType'];
    addTime = json['addTime'];
    timestamp = json['timestamp'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['location'] = location;
    data['homeTown'] = homeTown;
    data['imgs'] = imgs;
    data['tags'] = tags;
    data['password'] = password;
    data['name'] = name;
    data['account'] = account;
    data['imgUrl'] = imgUrl;
    data['userType'] = userType;
    data['addTime'] = addTime;
    data['timestamp'] = timestamp;
    data['__v'] = iV;
    return data;
  }
}
