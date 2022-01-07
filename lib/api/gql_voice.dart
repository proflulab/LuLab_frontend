import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../utils/utils.dart';
import '../entitys/entitys.dart';
import '../graphql/graphql.dart';

/// 语音
class VoiceAPI {
  static Future<VoiceResponse> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: voice, context: context, variables: {});

    return VoiceResponse.fromJson(response.data!);
  }
}
