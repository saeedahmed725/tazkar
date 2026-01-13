import 'package:dartz/dartz.dart';
import 'package:tazkar/core/utils/errors/failure.dart';

abstract class DownloadRepo {
  Future<Result<bool>> downloadDatabase(
      {void Function(int count, int total)? onReceiveProgress});

  bool checkDatabaseZipFileIsExist();

  Future<Result<Unit>> checkDatabaseIsUnzipOrNot();
}
