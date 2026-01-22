import 'package:easy_localization/easy_localization.dart';

enum MidnightMode {
  standard,
  jafari;

  String get label {
    switch (this) {
      case MidnightMode.standard:
        return 'midnightMode.standard'.tr();
      case MidnightMode.jafari:
        return 'midnightMode.jafari'.tr();
    }
  }

  static MidnightMode fromName(String name) {
    return MidnightMode.values.firstWhere(
      (mode) => mode.name == name,
      orElse: () => MidnightMode.standard,
    );
  }
}
