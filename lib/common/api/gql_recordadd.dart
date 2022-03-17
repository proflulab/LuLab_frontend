import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/graphql/record_add.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';

/// 课程详情
class GqlRecordAddAPI {
  static Future<RecordAdd> indexPageInfo({
    required BuildContext context,
    required RecordAddRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlRecordAddList,
        variables: variables.toJson());
    return RecordAdd.fromJson(response.data!);
  }
}
