import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/prayer_timings/data/model/prayer_cache_entries.dart';
import '../../features/prayer_tracker/data/model/prayer_tracker_entries.dart';

part 'app_database.g.dart';

/// Drift database used across the app.
@DriftDatabase(tables: [PrayerCacheEntries, PrayerTrackerEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.deleteTable('prayer_cache_entries');
        await m.createAll();
      }
      if (from < 3) {
        await m.createTable(prayerTrackerEntries);
      }
    },
  );
}

/// Table that caches yearly prayer timings keyed by request parameters.

LazyDatabase _openConnection() => LazyDatabase(() async {
  final dir = await getApplicationSupportDirectory();
  final file = File(p.join(dir.path, 'tazakar_db.sqlite'));
  return NativeDatabase.createInBackground(file);
});
