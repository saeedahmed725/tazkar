import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/Interceptors/internet_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio({String? baseUrl}) {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders(baseUrl);
      addDioInterceptor();
      return dio!;
    } else {
      if (baseUrl != null) addDioHeaders(baseUrl);
      return dio!;
    }
  }

  static void addDioHeaders(String? baseUrl) {
    dio?.options.baseUrl = baseUrl ?? dio!.options.baseUrl;
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  static void addDioInterceptor() {
    Iterable<Interceptor> interceptors = [
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
      InternetInterceptor(),
    ];
    dio?.interceptors.addAll(interceptors);
  }
}
