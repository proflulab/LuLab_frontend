import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:lab/common/entitys/data_login_captcha.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../entitys/data_login_verifysend.dart';
import '../entitys/data_userlogin_password.dart';

class GqlUserAPI {
  //验证码发送
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
  //验证码验证
  static Future<QueryLoginCaptcha> loginCaptcha({
    required BuildContext context,
    required LoginCaptchaRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlLoginCaptcha,
      variables: variables.toJson(),
    );
    return QueryLoginCaptcha.fromJson(response.data!);
  }
  //密码登录
  static Future<QueryLoginPassword> loginPassword({
    required BuildContext context,
    required LoginPasswordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaUser.gqlLoginPassword,
      variables: variables.toJson(),
    );
    return QueryLoginPassword.fromJson(response.data!);
  }
  // 登录
  static Future<UserLogin> login({
    required BuildContext context,
    required Loginrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlUserLogin,
      variables: variables.toJson(),
    );
    return UserLogin.fromJson(response.data!["userLogin"]);
  }

  // 注册
  static Future<UserRigister> register({
    required BuildContext context,
    required Registeredrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlUserRegister,
      variables: variables.toJson(),
    );

    return UserRigister.fromJson(response.data!["userRigister"]);
  }

  // 修改个人信息
  static Future<UserUpdateresponse> userup({
    required BuildContext context,
    required UserUpdaterequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlUserUpdata,
      variables: variables.toJson(),
    );

    return UserUpdateresponse.fromJson(response.data!);
  }

  // 一键登录
  static Future<UserLogin> quickLogin({
    required BuildContext context,
    required QuickLoginReq variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaUser.gqlUserQuickLogin,
      variables: variables.toJson(),
    );

    return UserLogin.fromJson(response.data!["mobileLogin"]);
  }
}
