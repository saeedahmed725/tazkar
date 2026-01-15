import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';

enum FailureType { network, internal, local }

abstract class Failure {
  final String message;
  final FailureType type;
  final int? errorCode;

  const Failure(this.message, this.type, {this.errorCode});

  static Future<Result<T>> handleOperation<T>({
    required Future<T> Function() operation,
    required String errorMessage,
  }) async {
    try {
      final result = await operation();
      return Result.success(result);
    } on InternetException catch (error) {
      return Result.error(NetworkFailure.fromInternetError(error));
    } on LocalException catch (error) {
      return Result.error(LocalFailure.fromException(error));
    } on FileSystemException catch (error) {
      return Result.error(LocalFailure.fromException(error));
    } on FormatException catch (error) {
      return Result.error(LocalFailure.fromException(error));
    } on RemoteException catch (error) {
      return Result.error(NetworkFailure(error.message, code: error.code));
    } on DioException catch (error) {
      return Result.error(NetworkFailure.fromDioError(error));
    } catch (e, stack) {
      log("Handled error: $e", stackTrace: stack);
      return Result.error(NetworkFailure("$errorMessage: $e"));
    }
  }

  static Stream<Result<T>> handleStreamOperation<T>({
    required Stream<T> Function() operation,
    required String errorMessage,
  }) async* {
    try {
      yield* operation().map((data) => Result.success(data));
    } on InternetException catch (error) {
      yield Result.error(NetworkFailure.fromInternetError(error));
    } on RemoteException catch (error) {
      yield Result.error(NetworkFailure(error.message, code: error.code));
    } on DioException catch (error) {
      yield Result.error(NetworkFailure.fromDioError(error));
    } on FileSystemException catch (error) {
      yield Result.error(LocalFailure.fromException(error));
    } on FormatException catch (error) {
      yield Result.error(LocalFailure.fromException(error));
    } on LocalException catch (error) {
      yield Result.error(LocalFailure.fromException(error));
    } catch (e, stack) {
      log("Handled error: $e", stackTrace: stack);
      yield Result.error(LocalFailure.fromException(Exception(e.toString())));
    }
  }
}

class Result<T> {
  final Either<Failure, T> data;

  Result({required this.data});

  Result.success(T value) : data = Right(value);

  Result.error(Failure failure) : data = Left(failure);

  bool get isSuccess => data.isRight();

  bool get isFailure => data.isLeft();

  B when<B>({
    required B Function(Failure failure) onFailure,
    required B Function(T success) onSuccess,
  }) {
    return data.fold(onFailure, onSuccess);
  }
}

// Represent failures from Network.
class NetworkFailure extends Failure {
  static const INTERNET_ERROR_CODE = 101;

  NetworkFailure(String message, {int? code = INTERNET_ERROR_CODE})
    : super(message, FailureType.network, errorCode: code);

  factory NetworkFailure.fromInternetError(InternetException exception) {
    return NetworkFailure('No internet connection', code: exception.code);
  }

  factory NetworkFailure.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure('Connection timeout with server');

      case DioExceptionType.sendTimeout:
        return NetworkFailure('Send timeout with server');

      case DioExceptionType.receiveTimeout:
        return NetworkFailure('Receive timeout with server');

      case DioExceptionType.badResponse:
        return _fromResponse(
          exception.response!.statusCode,
          exception.response!.data,
        );
      case DioExceptionType.cancel:
        return NetworkFailure('Request to server was canceled');
      case DioExceptionType.unknown:
        if (exception.error is SocketException) {
          return NetworkFailure('No Internet Connection');
        }
        return NetworkFailure('Unexpected Error, Please try again!');

      case DioExceptionType.badCertificate:
        if (exception.message.toString().contains('SocketException')) {
          return NetworkFailure('No Internet Connection');
        }
        return NetworkFailure('Unexpected Error, Please try again!');
      default:
        return NetworkFailure('Apps There was an Error, Please try again');
    }
  }

  static NetworkFailure _fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return NetworkFailure(
        response['detail'] ?? 'Unauthorized request, Please try later!',
      );
    } else if (statusCode == 404) {
      return NetworkFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return NetworkFailure('Internal Server error, Please try later');
    } else {
      return NetworkFailure('Ops There was an Error, Please try again');
    }
  }
}

// Represent failures from Cache.
class LocalFailure extends Failure {
  const LocalFailure(String message, {int? code})
    : super(message, FailureType.local, errorCode: code);

  // ignore_for_file: constant_identifier_names
  static const LOCATION_ERROR_CODE = 1;
  static const DATABASE_ERROR_CODE = 2;
  static const PERMISSION_ERROR_CODE = 4;
  static const GENERIC_ERROR_CODE = 3;

  factory LocalFailure.fromException(Exception exception) {
    if (exception is FileSystemException) {
      return LocalFailure(exception.message, code: DATABASE_ERROR_CODE);
    } else if (exception is FormatException) {
      return LocalFailure(exception.message, code: DATABASE_ERROR_CODE);
    } else if (exception is LocalException) {
      return LocalFailure(exception.message, code: exception.code);
    } else {
      return LocalFailure(exception.toString(), code: GENERIC_ERROR_CODE);
    }
  }

  @override
  String toString() {
    return 'LocalFailure: $message';
  }
}
