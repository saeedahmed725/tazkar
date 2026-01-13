import 'package:dio/dio.dart';

import '../../services/locator.dart';
import '../errors/error_code.dart';
import '../errors/exceptions.dart';

class InternetInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final hasInternet =
    await ServiceLocator.networkController.checkConnectivity();

    if (!hasInternet) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: InternetException(
            code: RemoteErrorCode.CONNECTION_INTERUPTED_ERROR_CODE,
          ),
          type: DioExceptionType.connectionError,
        ),
      );
    }

    return handler.next(options);
  }
}
