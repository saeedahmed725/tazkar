import 'package:easy_localization/easy_localization.dart';

enum PrayerSchool {
  shafi(0),
  hanafi(1);

  final int value;
  const PrayerSchool(this.value);
  String get label {
    switch (this) {
      case PrayerSchool.shafi:
        return "prayer_school_shafi".tr();
      case PrayerSchool.hanafi:
        return "prayer_school_hanafi".tr();
    }
  }

  static PrayerSchool fromName(String name) {
    return PrayerSchool.values.firstWhere(
      (school) => school.name == name,
      orElse: () => PrayerSchool.hanafi,
    );
  }

}
