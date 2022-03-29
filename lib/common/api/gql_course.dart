import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

/// 课程
class GqlCourseAPI {
  // 课程分类请求
  static Future<QueryCourseClassification> classIficationInfo({
    required BuildContext context,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: SchemaCourse.gqlCourseClassificationList,
      context: context,
      variables: {},
    );

    return QueryCourseClassification.fromJson(response.data!);
  }

  //小节课程请求
  static Future<PostsData> indexPageInfo({
    required BuildContext context,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: SchemaCourse.gqlCourseList, context: context, variables: {});

    return PostsData.fromJson(response.data!);
  }

  // 全部主课程详情请求
  static Future<MainCourseRequest> maincourse({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: SchemaCourse.gqlmainCourseList,
      context: context,
      variables: {},
    );

    return MainCourseRequest.fromJson(response.data!);
  }

  // 分类课程详情
  static Future<LatestDirectCourse> sortCourseInfo({
    required BuildContext context,
    required LatestDirectCourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaCourse.gqllatestDirectCourseList,
      variables: variables.toJson(),
    );
    return LatestDirectCourse.fromJson(response.data!);
  }

  //查询主课下每小节信息
  static Future<DetailCourse> detailsInfo({
    required BuildContext context,
    required CourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaCourse.gqlDetailCourseList,
      variables: variables.toJson(),
    );
    return DetailCourse.fromJson(response.data!);
  }

  // 单课程详情
  static Future<DetailMainCourse> singleCourseInfo({
    required BuildContext context,
    required DetailMainCourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaCourse.gqlDetailMainCourseList,
      variables: variables.toJson(),
    );
    return DetailMainCourse.fromJson(response.data!);
  }

  // 课程预约查询
  static Future<LatestUserCourseRecord> orderCourseInfo({
    required BuildContext context,
    required LatestUserCourseRecordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaHome.gqlLatestUserCourseRecordList,
      variables: variables.toJson(),
    );
    return LatestUserCourseRecord.fromJson(response.data!);
  }

  // 课程详情（目录，播放链接等）
  static Future<DetailCourseResponse> detailsCourseInfo({
    required BuildContext context,
    required DetailCourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaCourse.gqldetailsCourseList,
      variables: variables.toJson(),
    );
    return DetailCourseResponse.fromJson(response.data!);
  }
}
