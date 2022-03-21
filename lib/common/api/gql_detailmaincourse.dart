import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/detail_maincourse.dart';
import 'package:proflu/common/graphql/detail_maincourse.dart';

import '../../common/utils/utils.dart';

/// 课程详情
class GqlDetailMainCourseAPI {
  static Future<DetailMainCourse> indexPageInfo({
    required BuildContext context,
    required DetailMainCourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlDetailMainCourseList,
        variables: variables.toJson());
    return DetailMainCourse.fromJson(response.data!);
  }
}
