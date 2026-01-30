import 'package:drift/drift.dart';
import 'package:tazkar/core/database/app_database.dart';

enum PrayerType { fajr, dhuhr, asr, maghrib, isha }

class PrayerTrackerLocalDatasource {
  PrayerTrackerLocalDatasource(this._db);

  final AppDatabase _db;

  DateTime _normalizeDate(DateTime date) => DateTime(date.year, date.month, date.day);

  Future<PrayerTrackerEntry> getOrCreateToday() async {
    final today = _normalizeDate(DateTime.now());
    final query = _db.select(_db.prayerTrackerEntries)
      ..where((tbl) => tbl.date.equals(today));
    final existing = await query.getSingleOrNull();
    if (existing != null) {
      return existing;
    }

    final id = await _db.into(_db.prayerTrackerEntries).insert(
          PrayerTrackerEntriesCompanion.insert(date: today),
          mode: InsertMode.insertOrIgnore,
        );

    if (id == 0) {
      return (await query.getSingle())!;
    }

    return PrayerTrackerEntry(
      id: id,
      date: today,
      fajr: false,
      dhuhr: false,
      asr: false,
      maghrib: false,
      isha: false,
      updatedAt: DateTime.now(),
    );
  }

  Stream<PrayerTrackerEntry?> watchToday() {
    final today = _normalizeDate(DateTime.now());
    return (_db.select(_db.prayerTrackerEntries)
          ..where((tbl) => tbl.date.equals(today)))
        .watchSingleOrNull();
  }

  Future<void> setPrayerStatus({
    required PrayerType prayer,
    required bool value,
  }) async {
    final today = _normalizeDate(DateTime.now());
    final update = _db.update(_db.prayerTrackerEntries)
      ..where((tbl) => tbl.date.equals(today));

    await update.write(
      PrayerTrackerEntriesCompanion(
        fajr: prayer == PrayerType.fajr ? Value(value) : const Value.absent(),
        dhuhr: prayer == PrayerType.dhuhr ? Value(value) : const Value.absent(),
        asr: prayer == PrayerType.asr ? Value(value) : const Value.absent(),
        maghrib:
            prayer == PrayerType.maghrib ? Value(value) : const Value.absent(),
        isha: prayer == PrayerType.isha ? Value(value) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
