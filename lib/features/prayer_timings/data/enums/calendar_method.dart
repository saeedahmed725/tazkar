import 'package:easy_localization/easy_localization.dart';

enum CalendarMethod {
  hjcosa, // High Judicial Council of Saudi Arabia
  uaq, // Umm Al-Qura
  diyanet, // Turkey
  mathematical; // Mathematical

  String get label {
    switch (this) {
      case CalendarMethod.hjcosa:
        return 'calendarMethod.hjcosa'.tr();
      case CalendarMethod.uaq:
        return 'calendarMethod.uaq'.tr();
      case CalendarMethod.diyanet:
        return 'calendarMethod.diyanet'.tr();
      case CalendarMethod.mathematical:
        return 'calendarMethod.mathematical'.tr();
    }
  }

  static CalendarMethod fromName(String name) {
    return CalendarMethod.values.firstWhere(
      (method) => method.name == name,
      orElse: () => CalendarMethod.uaq,
    );
  }

}
