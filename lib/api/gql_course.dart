import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../utils/utils.dart';
import '../entitys/entitys.dart';
import '../graphql/graphql.dart';

/// 课程
class GqlCourseAPI {
  static Future<List<LatestCourse>> newsPageList({
    required BuildContext context,
    required Map<String, dynamic> params,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        context: context, schema: GQL_COURSE_LIST, variables: {});

    return response.data!['newsContents']
        .map<LatestCourse>((item) => LatestCourse.fromJson(item))
        .toList();
  }
}
