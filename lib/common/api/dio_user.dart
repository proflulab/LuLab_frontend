import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../common/utils/utils.dart';
import '../entitys/data_user_login.dart';
import '../services/services.dart';

class DioUserAPI {
  // 获取验证码
  static Future<VerificationCodeRes> codeSend({
    required BuildContext context,
    required String number,
  }) async {
    Response<dynamic> response = await DioClient().doPost(
      "${Api.tencentUrl}/sendMobileCode",
      data: {'mobile': number},
      options: Options(headers: {
        "Accept-Language": "zh-CN",
        "Accept": "*/*",
        "Accept-Encoding": "gzip,deflate,br",
        "connection": "keep-alive"
      }),
    );
    return VerificationCodeRes.fromJson(response.data);
  }

  // 校验验证码
  static Future<CodeCheckRes> codeCheck({
    required BuildContext context,
    required CodeCheckReq data,
  }) async {
    Response<dynamic> response = await DioClient().doPost(
      "${Api.tencentUrl}/verifyMobileCode",
      data: data.toJson(),
    );
    return CodeCheckRes.fromJson(response.data);
  }

  // 修改个人信息

  // 一键登录

}
