import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/live_course.dart';
import 'package:proflu/common/graphql/liveCourse.dart';

import '../../common/utils/utils.dart';

/// 课程
class GqlLiveAPI {
  static Future<LiveCourse> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: gqlLiveList, context: context, variables: {});

    return LiveCourse.fromJson(response.data!);
  }
}
