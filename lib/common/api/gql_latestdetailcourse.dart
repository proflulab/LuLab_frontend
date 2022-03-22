import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 课程详情
class GqlDetailCourseAPI {
  static Future<DetailCourse> indexPageInfo({
    required BuildContext context,
    required CourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: gqlDetailCourseList,
      variables: variables.toJson(),
    );
    return DetailCourse.fromJson(response.data!);
  }
}
