import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/latestrecord_data.dart';
import 'package:proflu/common/graphql/latest_record.dart';

import '../../common/utils/utils.dart';

/// 课程详情
class GqlLatestRecordAPI {
  static Future<LatestRecord> indexPageInfo({
    required BuildContext context,
    required LatestRecordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlLatestRecordList,
        variables: variables.toJson());
    return LatestRecord.fromJson(response.data!);
  }
}
