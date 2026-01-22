import 'package:easy_localization/easy_localization.dart';

enum Shafaq {
  general,
  ahmer,
  abyad;

  String get label {
    switch (this) {
      case Shafaq.general:
        return 'shafaq.general'.tr();
      case Shafaq.ahmer:
        return 'shafaq.ahmer'.tr();
      case Shafaq.abyad:
        return 'shafaq.abyad'.tr();
    }
  }

  static Shafaq fromName(String name) {
    return Shafaq.values.firstWhere(
      (shafaq) => shafaq.name == name,
      orElse: () => Shafaq.general,
    );
  }
}
