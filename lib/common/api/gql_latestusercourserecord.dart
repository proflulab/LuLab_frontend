import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:proflu/common/entitys/latestusercourserecord_data.dart';
import 'package:proflu/common/graphql/latest_usercourserecord.dart';

import '../../common/utils/utils.dart';

/// 课程详情
class GqlLatestUserCourseRecordAPI {
  static Future<LatestUserCourseRecord> indexPageInfo({
    required BuildContext context,
    required LatestUserCourseRecordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: gqlLatestUserCourseRecordList,
        variables: variables.toJson());
    return LatestUserCourseRecord.fromJson(response.data!);
  }
}
