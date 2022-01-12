import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

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
