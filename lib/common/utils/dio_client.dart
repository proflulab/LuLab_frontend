import 'package:dio/dio.dart';

class DioClientUtil {
  void getHttp() {
    // var dio = Dio(); // with default Options

    // // Set default configs
    // dio.options.baseUrl = 'https://www.xx.com/api';
    // dio.options.connectTimeout = 5000; //5s
    // dio.options.receiveTimeout = 3000;

    // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = Dio(options);
  }
}
