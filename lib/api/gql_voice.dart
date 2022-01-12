import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../entitys/entitys.dart';
import '../graphql/graphql.dart';
import '../utils/utils.dart';

// 语音
class VoiceAPI {
  static Future<VoiceResponse> indexPageInfo({
    required BuildContext context,
    required String schema,
    variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: voice, context: context, variables: {});

    return VoiceResponse.fromJson(response.data!);
  }
}
