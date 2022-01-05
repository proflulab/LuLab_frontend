import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../utils/utils.dart';
import '../entitys/entitys.dart';
import '../graphql/graphql.dart';

class SourseAPI {
  // 资讯信息请求
  static Future<Inforponse> userup({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: gqlSourseInfror,
      context: context,
      variables: {},
    );

    return Inforponse.fromJson(response.data!);
  }
}
