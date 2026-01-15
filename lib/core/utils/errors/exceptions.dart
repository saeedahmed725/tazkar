import 'package:dio/dio.dart';

class InternetException extends DioException implements Exception {
  final int? code;

  InternetException({this.code, required super.requestOptions});

  @override
  String toString() {
    return 'InternalException: No internet Error code :$code';
  }
}

class RemoteException implements Exception {
  final String message;
  final int? code;

  RemoteException(this.message, {this.code});

  @override
  String toString() {
    return 'RemoteDataSourceException: $message, Error code :$code';
  }
}

// Represent exceptions from Cache.
class LocalException implements Exception {
  final int? code;
  final String message;

  LocalException(this.message, {this.code});

  @override
  String toString() {
    return 'LocalException: $message Error Code: $code';
  }
}
