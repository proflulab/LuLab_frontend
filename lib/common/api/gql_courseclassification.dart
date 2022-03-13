import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/course_classification_data.dart';
import 'package:proflu/common/graphql/course_classification.dart';

import '../../common/utils/utils.dart';

/// 功勋员
class GqlCourseClassificationAPI {
  static Future<QueryCourseClassification> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: gqlCourseClassificationList, context: context, variables: {});

    return QueryCourseClassification.fromJson(response.data!);
  }
}
