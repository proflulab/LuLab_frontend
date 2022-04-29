import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

// 语音交互请求
class VoiceAPI {
  static Future<VoiceResponse> indexPageInfo({
    required BuildContext context,
    required VoiceRequest variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
      schema: voice,
      context: context,
      variables: variables.toJson(),
    );
    return VoiceResponse.fromJson(response.data!);
  }
}
