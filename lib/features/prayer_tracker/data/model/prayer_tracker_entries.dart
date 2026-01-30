import 'package:drift/drift.dart';

class PrayerTrackerEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Normalized local date (00:00) for daily progress.
  DateTimeColumn get date => dateTime()();

  BoolColumn get fajr => boolean().withDefault(const Constant(false))();
  BoolColumn get dhuhr => boolean().withDefault(const Constant(false))();
  BoolColumn get asr => boolean().withDefault(const Constant(false))();
  BoolColumn get maghrib => boolean().withDefault(const Constant(false))();
  BoolColumn get isha => boolean().withDefault(const Constant(false))();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {date},
      ];
}
