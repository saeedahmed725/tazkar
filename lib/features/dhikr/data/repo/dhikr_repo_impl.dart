import 'package:dartz/dartz.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/dhikr/data/datasource/dhikr_local_datasource.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_category_model.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_data_model.dart';
import 'package:tazkar/features/dhikr/domain/repo/dhikr_repo.dart';

class DhikrRepoImpl extends DhikrRepo {
  final DhikrLocalDataSource local;

  DhikrRepoImpl({required this.local});

  @override
  Future<Result<List<AzkarCategoryModel>>> getAzkarCategories() async {
    try {
      final categories = await local.getAzkarCategories();
      return Result(data: Right(categories));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<AzkarDataModel>>> getAllAzkarData() async {
    try {
      final azkarData = await local.getAllAzkarData();
      return Result(data: Right(azkarData));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<AzkarDataModel>>> getAzkarDataByCategory({
    required int categoryId,
  }) async {
    try {
      final azkarData = await local.getAzkarDataByCategory(
        categoryId: categoryId,
      );
      return Result(data: Right(azkarData));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }
}
