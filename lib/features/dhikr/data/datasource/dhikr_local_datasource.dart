import 'dart:developer';

import 'package:tazkar/core/services/db_helper.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_category_model.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_data_model.dart';

class DhikrLocalDataSource {
  DhikrLocalDataSource();

  // Get all azkar categories
  Future<List<AzkarCategoryModel>> getAzkarCategories() async {
    return DbHelper.instance.readDatabaseFile<List<AzkarCategoryModel>>(
      table: 'azkar_titles',
      fromJson: (json) {
        List<dynamic> data = json;
        log('Azkar Categories: ${data.length}', name: 'DhikrLocalDataSource');
        return data.map((d) => AzkarCategoryModel.fromJson(d)).toList();
      },
    );
  }

  // Get all azkar data
  Future<List<AzkarDataModel>> getAllAzkarData() async {
    return DbHelper.instance.readDatabaseFile<List<AzkarDataModel>>(
      table: 'azkar_data',
      fromJson: (json) {
        List<dynamic> data = json;
        log('All Azkar Data: ${data.length}', name: 'DhikrLocalDataSource');
        return data.map((d) => AzkarDataModel.fromJson(d)).toList();
      },
    );
  }

  // Get azkar data by category
  Future<List<AzkarDataModel>> getAzkarDataByCategory({
    required int categoryId,
  }) async {
    return DbHelper.instance.readDatabaseFile<List<AzkarDataModel>>(
      table: 'azkar_data',
      where: 'category_id = ?',
      whereArgs: [categoryId],
      fromJson: (json) {
        List<dynamic> data = json;
        log(
          'Azkar Data for category $categoryId: ${data.length}',
          name: 'DhikrLocalDataSource',
        );
        return data.map((d) => AzkarDataModel.fromJson(d)).toList();
      },
    );
  }
}
