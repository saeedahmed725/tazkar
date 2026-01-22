import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_category_model.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_data_model.dart';

abstract class DhikrRepo {
  Future<Result<List<AzkarCategoryModel>>> getAzkarCategories();

  Future<Result<List<AzkarDataModel>>> getAllAzkarData();

  Future<Result<List<AzkarDataModel>>> getAzkarDataByCategory({
    required int categoryId,
  });
}
