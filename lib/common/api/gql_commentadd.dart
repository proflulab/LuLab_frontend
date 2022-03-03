import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 课程详情
class GqlCommentAddAPI {
  static Future<CommentAdd> indexPageInfo({
    required BuildContext context,
    required CommentAddRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlCommentAddList,
        variables: variables.toJson());
    return CommentAdd.fromJson(response.data!);
  }
}
