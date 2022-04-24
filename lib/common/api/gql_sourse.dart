import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

// 资讯信息请求
class SourseAPI {
  static Future<Inforponse> inforInfo({
    required BuildContext context,
    required Inforrequest variables
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: SchemaSourse.gqlSourseInfror,
      context: context,
      variables:variables.toJson(),
    );

    return Inforponse.fromJson(response.data!);
  }
}
