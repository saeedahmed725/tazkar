import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:tazkar/core/database/app_database.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_query.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_timings_model.dart';

class PrayerTimingsLocalDatasource {
  PrayerTimingsLocalDatasource(this._db);

  final AppDatabase _db;

  Future<PrayerTimingsModel?> getCachedCalendar(PrayerQuery query) async {
    final row = await (_db.select(_db.prayerCacheEntries)
          ..where((tbl) => tbl.year.equals(query.year))
          ..where((tbl) => tbl.address.equals(query.address))
          ..where((tbl) => tbl.method.equals(query.method.value))
          ..where((tbl) => tbl.school.equals(query.school.value))
          ..where((tbl) => tbl.midnightMode.equals(query.midnightMode.index))
          ..where((tbl) => tbl.latitudeAdjustmentMethod.equalsNullable(
              query.latitudeAdjustmentMethod?.value))
          ..where((tbl) => tbl.calendarMethod.equals(query.calendarMethod.name))
          ..where((tbl) => tbl.shafaq.equals(query.shafaq.name))
          ..where((tbl) => tbl.tune.equalsNullable(_encodeTune(query.tune))))
        .getSingleOrNull();

    if (row == null) return null;

    final Map<String, dynamic> decoded = jsonDecode(row.payload);
    return PrayerTimingsModel.fromJson(decoded);
  }

  Future<void> cacheCalendar({
    required PrayerQuery query,
    required PrayerTimingsModel model,
  }) async {
    await _db.into(_db.prayerCacheEntries).insertOnConflictUpdate(
          PrayerCacheEntriesCompanion(
            year: Value(query.year),
            address: Value(query.address),
            method: Value(query.method.value),
            school: Value(query.school.value),
            midnightMode: Value(query.midnightMode.index),
            latitudeAdjustmentMethod:
                Value(query.latitudeAdjustmentMethod?.value),
            calendarMethod: Value(query.calendarMethod.name),
            shafaq: Value(query.shafaq.name),
            tune: Value(_encodeTune(query.tune)),
            payload: Value(jsonEncode(model.toJson())),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  String? _encodeTune(List<int>? tune) {
    if (tune == null) return null;
    return jsonEncode(tune);
  }
}
