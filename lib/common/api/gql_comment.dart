import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/utils/utils.dart';
import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';

class GqlCommentAPI {
  // 请求评论
  static Future<CommentResponse> commentRequestInfo({
    required BuildContext context,
    required CommentRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaComment.gqlLatestCommentList,
      variables: variables.toJson(),
    );
    return CommentResponse.fromJson(response.data!);
  }

  // 添加评论
  static Future<CommentAddResponse> commenAddInfo({
    required BuildContext context,
    required CommentAddRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaComment.gqlCommentAddList,
      variables: variables.toJson(),
    );
    return CommentAddResponse.fromJson(response.data!);
  }

  //删除评论
}
