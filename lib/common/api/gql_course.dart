import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:lab/common/entitys/data_course_link.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 课程
class GqlCourseAPI {
  /// 课程分类courseCategory
  static Future<QueryCourseCategory> courseCategory({
    required BuildContext context,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: SchemaCourse.gqlCourseCategory,
      context: context,
      variables: {},
    );

    return QueryCourseCategory.fromJson(response.data!);
  }
  /// 课程列表查询course
  static Future<QueryCourse> course({
    required BuildContext context,
    required CourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaCourse.gqlCourse,
      variables: variables.toJson(),
    );
    return QueryCourse.fromJson(response.data!);
  }
  /// 课程目录查询courseCatalogue
  static Future<QueryCourseCatalogue> courseCatalogue({
    required BuildContext context,
    required CourseCatalogueRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaCourse.gqlCourseCatalogue,
      variables: variables.toJson(),
    );
    return QueryCourseCatalogue.fromJson(response.data!);
  }
  /// 课程链接courseLink
  static Future<QueryCourseLink> courseLink({
    required BuildContext context,
    required CourseLinkRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      context: context,
      schema: SchemaCourse.gqlCourseLink,
      variables: variables.toJson(),
    );
    return QueryCourseLink.fromJson(response.data!);
  }
  // /// （废除）课程详情查询courseDetail
  // static Future<QueryCourseDetail> courseDetail({
  //   required BuildContext context,
  //   required CourseDetailRequest variables,
  // }) async {
  //   QueryResult response = await GraphqlClientUtil.query(
  //     context: context,
  //     schema: SchemaCourse.gqlCourseDetail,
  //     variables: variables.toJson(),
  //   );
  //   return QueryCourseDetail.fromJson(response.data!);
  // }
}
