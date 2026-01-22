import 'package:tazkar/core/network/network_client.dart';

import '../enums/calendar_method.dart';
import '../enums/latitude_adjustment_method.dart';
import '../enums/midnight_mode.dart';
import '../enums/prayer_calculation_method.dart';
import '../enums/prayer_school.dart';
import '../enums/shafaq.dart';
import '../model/prayer_timings_model.dart';

class PrayerTimingsDatasource {
  final NetworkClient _networkClient;

  PrayerTimingsDatasource(this._networkClient);

  /// Fetches prayer timings for a full Gregorian year
  Future<PrayerTimingsModel> getAnnualPrayerCalendar({
    required int year,
    required String address,
    PrayerCalculationMethod method = PrayerCalculationMethod.egyptian,
    PrayerSchool school = PrayerSchool.hanafi,
    MidnightMode midnightMode = MidnightMode.standard,
    LatitudeAdjustmentMethod? latitudeAdjustmentMethod,
    CalendarMethod calendarMethod = CalendarMethod.hjcosa,
    Shafaq shafaq = Shafaq.general,
    List<int>? tune,
  }) async {
    final response = await _networkClient.get(
      "/calendarByAddress/$year",
      baseUrl: "https://api.aladhan.com/v1",
      queryParameters: {
        "address": address,
        "method": method.value,
        "school": school.value,
        "midnightMode": midnightMode.index,
        "calendarMethod": calendarMethod.name.toUpperCase(),
        "shafaq": shafaq.name,
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod?.value,
        "timezonestring": 'UTC',
        "iso8601": true,
      },
    );

    return PrayerTimingsModel.fromJson(response.data);
  }
}
