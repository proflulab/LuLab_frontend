import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

class GqlUserAPI {
  // 登录
  static Future<UserLogin> login({
    required BuildContext context,
    required Loginrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context, schema: gqlUserLogin, variables: variables.toJson());
    return UserLogin.fromJson(response.data!["userLogin"]);
  }

  // 注册
  static Future<UserRigister> register({
    required BuildContext context,
    required Registeredrequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlUserRegister,
        variables: variables.toJson());

    return UserRigister.fromJson(response.data!["userRigister"]);
  }

  // 个人信息更新
  static Future<UserUpdateresponse> userup({
    required BuildContext context,
    required UserUpdaterequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context, schema: gqlUserUpdata, variables: variables.toJson());

    return UserUpdateresponse.fromJson(response.data!);
  }
}
