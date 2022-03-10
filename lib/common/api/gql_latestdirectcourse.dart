import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/latestdirectcourse_data.dart';
import 'package:proflu/common/graphql/latest_directcourse.dart';

import '../../common/utils/utils.dart';

/// 课程详情
class GqlLatestDirectCourseAPI {
  static Future<LatestDirectCourse> indexPageInfo({
    required BuildContext context,
    required LatestDirectCourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqllatestDirectCourseList,
        variables: variables.toJson());
    return LatestDirectCourse.fromJson(response.data!);
  }
}
