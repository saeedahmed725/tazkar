import 'package:drift/drift.dart';

class PrayerCacheEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get year => integer()();
  TextColumn get address => text()();
  IntColumn get method => integer()();
  IntColumn get school => integer()();
  IntColumn get midnightMode => integer()();
  IntColumn get latitudeAdjustmentMethod => integer().nullable()();
  TextColumn get calendarMethod => text()();
  TextColumn get shafaq => text()();
  TextColumn get tune => text().nullable()();

  /// Raw JSON payload for the full calendar response.
  TextColumn get payload => text()();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {
      year,
      address,
      method,
      school,
      midnightMode,
      latitudeAdjustmentMethod,
      calendarMethod,
      shafaq,
      tune,
    },
  ];
}
