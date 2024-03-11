import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:lab/common/entitys/data_login_captcha.dart';
import 'package:lab/common/entitys/data_login_verifycheck.dart';
import 'package:lab/common/entitys/data_login_verifycheck_email.dart';
import 'package:lab/common/entitys/data_login_verifysend_email.dart';
import '../../common/utils/utils.dart';
import '../../common/graphql/graphql.dart';
// import '../../common/entitys/entitys.dart';
import '../entitys/data_login_out.dart';
import '../entitys/data_login_password.dart';
import '../entitys/data_login_verifysend.dart';
import '../entitys/data_user_Info.dart';
import '../entitys/data_user_changepassword.dart';
import '../entitys/data_user_changeuserinfo.dart';
import '../entitys/data_user_mobilechange.dart';

class GqlUserAPI {
  ///邮箱验证码发送
  static Future<QueryVerifySendEmail> verifySendEmail({
    required BuildContext context,
    required VerifySendRequestEmail variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlVerifySendEmail,
      variables: variables.toJson(),
    );
    return QueryVerifySendEmail.fromJson(response.data!);
  }

  ///邮箱验证码验证
  static Future<QueryVerifyCheckEmail> verifyCheckEmail({
    required BuildContext context,
    required VerifyCheckRequestEmail variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlVerifyCheckEmail,
      variables: variables.toJson(),
    );
    return QueryVerifyCheckEmail.fromJson(response.data!);
  }

  ///手机验证码发送
  static Future<QueryVerifySend> verifySend({
    required BuildContext context,
    required VerifySendRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlVerifySend,
      variables: variables.toJson(),
    );
    return QueryVerifySend.fromJson(response.data!);
  }

  ///手机验证码验证
  static Future<QueryVerifyCheck> verifyCheck({
    required BuildContext context,
    required VerifyCheckRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlVerifyCheck,
      variables: variables.toJson(),
    );
    return QueryVerifyCheck.fromJson(response.data!);
  }

  ///手机验证码登陆
  // static Future<QueryLoginCaptcha> loginCaptcha({
  //   required BuildContext context,
  //   required LoginCaptchaRequest variables,
  // }) async {
  //   QueryResult response = await GraphqlClientUtil.query(
  //     context: context,
  //     schema: SchemaUser.gqlLoginCaptcha,
  //     variables: variables.toJson(),
  //   );
  //   return QueryLoginCaptcha.fromJson(response.data!);
  // }

  ///密码登录
  static Future<LoginPassword> loginPassword({
    required BuildContext context,
    required LoginPasswordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlLoginPassword,
      variables: variables.toJson(),
    );
    return LoginPassword.fromJson(response.data!);
  }

  ///退出登陆
  static Future<QueryLoginOut> loginOut({
    required BuildContext context,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlLoginOut,
      variables: {},
    );
    return QueryLoginOut.fromJson(response.data!);
  }

  ///用户信息查询
  static Future<QueryUserInfo> userInfo({
    required BuildContext context,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlUserInfo,
      variables: {},
    );
    return QueryUserInfo.fromJson(response.data!);
  }

  ///修改密码
  static Future<QueryChangePassword> passwordChange({
    required BuildContext context,
    required ChangePasswordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlPasswordChange,
      variables: variables.toJson(),
    );
    return QueryChangePassword.fromJson(response.data!);
  }

  ///修改手机号
  static Future<QueryMobileChange> mobileChange({
    required BuildContext context,
    required MobileChangeRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlMobileChange,
      variables: variables.toJson(),
    );
    return QueryMobileChange.fromJson(response.data!);
  }

  ///修改用户信息
  static Future<QueryChangeUserInfo> changeUserInfo({
    required BuildContext context,
    required ChangeUserInfoRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlChangeUserInfo,
      variables: variables.toJson(),
    );
    return QueryChangeUserInfo.fromJson(response.data!);
  }
}
