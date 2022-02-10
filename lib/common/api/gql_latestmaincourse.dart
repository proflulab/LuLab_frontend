import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/main_coursedata.dart';

import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 主要课程
class GqlMainCourseAPI {
  static Future<LatestMainCourse> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: gqlMainCourseList, context: context, variables: {});

    return LatestMainCourse.fromJson(response.data!);
  }
}
