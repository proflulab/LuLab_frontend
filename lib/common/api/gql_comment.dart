import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

class GqlCommentAPI {
  // 请求课程评论
  static Future<LatestComment> commentRequestInfo({
    required BuildContext context,
    required LatestCommentRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaComment.gqlLatestCommentList,
      variables: variables.toJson(),
    );
    return LatestComment.fromJson(response.data!);
  }

  // 添加课程评论
  static Future<CommentAdd> commenAddInfo({
    required BuildContext context,
    required CommentAddRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaComment.gqlCommentAddList,
      variables: variables.toJson(),
    );
    return CommentAdd.fromJson(response.data!);
  }
}
