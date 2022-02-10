import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/comment_add_data.dart';
import 'package:proflu/common/entitys/detail_coursedata.dart';
import 'package:proflu/common/graphql/commentAdd.dart';

import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';

/// 课程详情
class GqlCommentAddAPI {
  static Future<CommentAdd> indexPageInfo({
    required BuildContext context,
    required CourseRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlCommentAddList,
        variables: variables.toJson());
    return CommentAdd.fromJson(response.data!);
  }
}
