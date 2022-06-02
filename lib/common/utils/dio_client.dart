import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../services/network_config.dart';
import '../services/services.dart';
// import 'core/option_interceptor.dart';
// import 'core/net_cache_interceptor.dart';
// import 'core/request_interceptor.dart';
import 'package:dio/native_imp.dart'; //在浏览器中, import 'package:dio/browser_imp.dart'

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class DioClient extends DioForNative {
  static DioClient? _instance;

  factory DioClient() => _instance ??= DioClient._init();

  DioClient._init() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    options = BaseOptions(
      baseUrl: NetworkConfig.baseUrl,

      /// 连接服务器超时时间，单位是毫秒.
      connectTimeout: NetworkConfig.connectTimeout,

      /// 2.x中为接收数据的最长时限.
      receiveTimeout: NetworkConfig.receiveTimeout,
    );
    //处理头部
    /////interceptors.add(OptionInterceptor());
    //处理网络缓存
    ////interceptors.add(NetCacheInterceptor());
    //处理回来的数据
    /////interceptors.add(RequestInterceptor());
    proxy();
  }

  ///get请求
  doGet<T>(
    path, {
    queryParameters,
    options,
    cancelToken,
    onReceiveProgress,
  }) {
    return get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  ///post请求
  doPost(
    path, {
    queryParameters,
    data,
    options,
    cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) {
    return post(
      path,
      queryParameters: queryParameters,
      options: options,
      data: data,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  doGetUri<T>(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return getUri<T>(
      uri,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  doPostUri<T>(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return postUri<T>(
      uri,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  ///put请求
  doPut<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return put<T>(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  ///上传文件
  uploadFile(formData) {
    var uploadOptions = Options(contentType: "multipart/form-data");
    return doPost(Api.uploadURL, options: uploadOptions, data: formData);
  }

  ///代理抓包测试用
  void proxy() {
    if (NetworkConfig.proxyEnable) {
      if (NetworkConfig.caughtAddress != "") {
        (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.findProxy = (Uri uri) {
            return 'PROXY ' + NetworkConfig.caughtAddress;
          };
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            return true;
          };
          return null;
        };
      }
    }
  }
}
