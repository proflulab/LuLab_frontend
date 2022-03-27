import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../graphql/schema_home.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';

class GqlHomeAPI {
  // 添加预约
  static Future<RecordAdd> recordAddInfo({
    required BuildContext context,
    required RecordAddRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaHome.gqlRecordAddList,
      variables: variables.toJson(),
    );
    return RecordAdd.fromJson(response.data!);
  }

  // 所有预约查询
  static Future<LatestRecord> ordersInfo({
    required BuildContext context,
    required LatestRecordRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
      context: context,
      schema: SchemaHome.gqlLatestRecordList,
      variables: variables.toJson(),
    );
    return LatestRecord.fromJson(response.data!);
  }

  // 功勋员查询
  static Future<Feats> featInfo({
    required BuildContext context,
    required FeatsRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: SchemaHome.gqlModelList,
      context: context,
      variables: variables.toJson(),
    );

    return Feats.fromJson(response.data!);
  }
}
