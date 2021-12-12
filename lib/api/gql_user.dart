import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../utils/utils.dart';
import '../entitys/entitys.dart';
import '../graphql/graphql.dart';

class GqlUserAPI {
  // 登录
  static Future<UserLogin> login({
    required BuildContext context,
    required Loginrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_LOGIN,
        variables: variables.toJson());
    return UserLogin.fromJson(response.data!["userLogin"]);
  }

  // 注册
  static Future<UserRigister> register({
    required BuildContext context,
    required Registeredrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_REGISTER,
        variables: variables.toJson());

    return UserRigister.fromJson(response.data!["userRigister"]);
  }

  // 个人信息更新
  static Future<UserUpdateresponse> userup({
    required BuildContext context,
    required UserUpdaterequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_UPDATE,
        variables: variables.toJson());

    return UserUpdateresponse.fromJson(response.data!);
  }
}
