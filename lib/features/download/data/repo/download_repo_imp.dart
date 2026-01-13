import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tazkar/core/services/db_helper.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/download/domain/repo/download_repo.dart';

class DownloadRepoImp extends DownloadRepo {
  @override
  bool checkDatabaseZipFileIsExist() {
    return DbHelper.instance.checkDatabaseZipFileIsExist();
  }

  @override
  Future<Result<bool>> downloadDatabase(
      {void Function(int count, int total)? onReceiveProgress}) async {
    try {
      return Result(
        data: right(await DbHelper.instance.downloadDatabase(onReceiveProgress)),
      );
    } on InternetException catch (exception) {
      return Result(data: left(NetworkFailure.fromInternetError(exception)));
    } on DioException catch (exception) {
      return Result(data: left(NetworkFailure.fromDioError(exception)));
    } catch (exception) {
      return Result(data: left(NetworkFailure(exception.toString())));
    }
  }

  @override
  Future<Result<Unit>> checkDatabaseIsUnzipOrNot() async {
    try {
      return Result(
        data: Right(await DbHelper.instance.checkDatabaseIsUnzipOrNot()),
      );
    } on LocalException catch (exception) {
      return Result(
        data: Left(LocalFailure.fromIoException(exception)),
      );
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }
}
