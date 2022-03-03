import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../common/entitys/entitys.dart';
import '../../common/graphql/graphql.dart';
import '../../common/utils/utils.dart';

/// 功勋员
class GqlModelAPI {
  static Future<LatestModel> indexPageInfo({
    required BuildContext context,
    required String schema,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        schema: gqlModelList, context: context, variables: {});

    return LatestModel.fromJson(response.data!);
  }
}
