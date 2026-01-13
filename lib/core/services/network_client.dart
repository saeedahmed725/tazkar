import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient(this._dio);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.post<T>(
      url,
      data: data,
      options: options,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response> put(
    String url, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }

  Future<Response> download(
    String url,
    String pathName,
    void Function(int count, int total)? onReceiveProgress,
  ) async {
    Response response;
    response = await _dio.download(
      url,
      pathName,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
