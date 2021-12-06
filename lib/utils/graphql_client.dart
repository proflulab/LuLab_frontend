import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../values/values.dart';

class GraphqlClientUtil {
  static client() {
    final _httpLink = HttpLink(
      '$SERVER_API_GRAPHQL_URL',
    );

    // final AuthLink _authLink = AuthLink(
    //   getToken: () =>
    //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlZmMzNDdhYzgzOTVjMDAwY2ViYzE5NyIsImlhdCI6MTU5MzY1NDcwNiwiZXhwIjoxNTk2MjQ2NzA2fQ.RYDmNSDJxcZLLPHAf4u59IER7Bs5VoWfBo1_t-TR5yY',
    // );

    // final Link _link = _authLink.concat(_httpLink);

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );
  }

  // 查询
  static Future query({
    required BuildContext? context,
    required String schema,
    required Map<String, dynamic> nRepositories,
    //int nRepositories = 50,
  }) async {
    QueryOptions options = QueryOptions(
      document: gql(schema),
      variables: <String, dynamic>{
        'nRepositories': nRepositories,
      },
    );

    QueryResult result = await client().query(options);

    if (result.hasException) {
      print(result.exception.toString());
      //toastInfo(msg: result.exception.toString());
      //throw result.exception;
    }

    return result;
  }

  // 操作
  static Future mutate({
    required BuildContext context,
    required String schema,
    required Map<String, dynamic> variables,
  }) async {
    MutationOptions options = MutationOptions(
      document: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().mutate(options);
    if (result.hasException) {
      print(result.exception.toString());
      //toastInfo(msg: result.exception.toString());
      //throw result.exception;
    }

    return result;
  }
}
