import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

class MainCourseAPI {
  // 课程详情信息请求
  static Future<MainCourseRequest> maincourse({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: gqlmainCourseList,
      context: context,
      variables: {},
    );

    return MainCourseRequest.fromJson(response.data!);
  }
}
