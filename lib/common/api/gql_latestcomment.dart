import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 课程详情
class GqlLatestCommentAPI {
  static Future<LatestComment> indexPageInfo({
    required BuildContext context,
    required LatestCommentRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlLatestCommentList,
        variables: variables.toJson());
    return LatestComment.fromJson(response.data!);
  }
}
