import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../utils/utils.dart';
import '../entitys/entitys.dart';
import '../graphql/graphql.dart';

/// 课程
class GqlCourseAPI {
  static Future<PostsData> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: GQL_COURSE_LIST, context: context, nRepositories: {});

    return PostsData.fromJson(response.data!);
  }

  // static Future<List<LatestCourse>> newsPageList({
  //   required BuildContext context,
  //   required Map<String, dynamic> params,
  // }) async {
  //   QueryResult response = await GraphqlClientUtil.query(
  //       context: context, schema: GQL_COURSE_LIST, variables: {});

  //   return response.data!['latestCourse']
  //       .map<LatestCourse>((item) => LatestCourse.fromJson(item))
  //       .toList();
  // }
}
