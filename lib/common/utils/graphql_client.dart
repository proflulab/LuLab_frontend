import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../services/services.dart';
import '../widget/toast.dart';

class GraphqlClientUtil {
  static client() {
    final _httpLink = HttpLink(
      serverApiGraphqlUrl,
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
    required Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      document: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception.toString());
      }
      toastInfo(msg: result.exception.toString());
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
      if (kDebugMode) {
        print(
          result.exception.toString(),
        );
      }
      //toastInfo(msg: result.exception.toString());
      //throw result.exception;
    }
    return result;
  }

  //   /// 错误处理
  // static _formatException(BuildContext context, OperationException exception) {
  //   var statusCode = '';
  //   try {
  //     statusCode = exception
  //         .graphqlErrors[0]?.extensions["exception"]["output"]["statusCode"]
  //         .toString();
  //     if (statusCode == '') {
  //       statusCode = exception.graphqlErrors[0]?.extensions["exception"]["code"]
  //           .toString();
  //     }
  //   } catch (e) {}

  //   switch (statusCode) {
  //     case '400': // 重新登录
  //       toastInfo(msg: "错误请求，提交数据错误！");
  //       break;
  //     case '401': // 没有认证
  //     case '403': // 没有授权
  //       toastInfo(msg: "账号无效、服务没有授权，请重新登录！");
  //       return goLoginPage(context);
  //     // break;
  //     default:
  //       toastInfo(msg: exception.toString());
  //   }
  //   throw exception;
  // }
}
