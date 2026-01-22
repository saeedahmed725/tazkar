import '../enums/calendar_method.dart';
import '../enums/latitude_adjustment_method.dart';
import '../enums/midnight_mode.dart';
import '../enums/prayer_calculation_method.dart';
import '../enums/prayer_school.dart';
import '../enums/shafaq.dart';

class PrayerQuery {
  final int year;
  final String address;
  final PrayerCalculationMethod method;
  final PrayerSchool school;
  final MidnightMode midnightMode;
  final LatitudeAdjustmentMethod? latitudeAdjustmentMethod;
  final CalendarMethod calendarMethod;
  final Shafaq shafaq;
  final List<int>? tune;

  const PrayerQuery({
    required this.year,
    required this.address,
    required this.method,
    required this.school,
    required this.midnightMode,
    this.latitudeAdjustmentMethod,
    required this.calendarMethod,
    required this.shafaq,
    this.tune,
  });

  PrayerQuery copyWith({
    int? year,
    String? address,
    PrayerCalculationMethod? method,
    PrayerSchool? school,
    MidnightMode? midnightMode,
    LatitudeAdjustmentMethod? latitudeAdjustmentMethod,
    CalendarMethod? calendarMethod,
    Shafaq? shafaq,
    List<int>? tune,
  }) {
    return PrayerQuery(
      year: year ?? this.year,
      address: address ?? this.address,
      method: method ?? this.method,
      school: school ?? this.school,
      midnightMode: midnightMode ?? this.midnightMode,
      latitudeAdjustmentMethod:
          latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      calendarMethod: calendarMethod ?? this.calendarMethod,
      shafaq: shafaq ?? this.shafaq,
      tune: tune ?? this.tune,
    );
  }
}
