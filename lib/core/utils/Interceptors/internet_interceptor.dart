import 'package:dio/dio.dart';
import 'package:tazkar/core/network/connectivity.dart';

import '../../locator/locator.dart';
import '../errors/exceptions.dart';

class InternetInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final hasInternet = await ServiceLocator.get<NetworkController>()
        .checkConnectivity();
    if (!hasInternet) {
      return handler.reject(
        InternetException(requestOptions: options, code: -1),
      );
    }
    return super.onRequest(options, handler);
  }
}
