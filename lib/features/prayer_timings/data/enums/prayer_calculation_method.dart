import 'package:easy_localization/easy_localization.dart';

enum PrayerCalculationMethod {
  jafari(0),
  karachi(1),
  isna(2),
  mwl(3),
  ummAlQura(4),
  egyptian(5),
  tehran(7),
  gulf(8),
  kuwait(9),
  qatar(10),
  singapore(11),
  france(12),
  turkey(13),
  russia(14),
  moonsighting(15),
  dubai(16),
  malaysia(17),
  tunisia(18),
  algeria(19),
  indonesia(20),
  morocco(21),
  lisbon(22),
  jordan(23),
  custom(99);

  const PrayerCalculationMethod(this.value);

  final int value;

  String get label {
    switch (this) {
      case PrayerCalculationMethod.jafari:
        return "prayer_method_jafari".tr();
      case PrayerCalculationMethod.karachi:
        return "prayer_method_karachi".tr();
      case PrayerCalculationMethod.isna:
        return "prayer_method_isna".tr();
      case PrayerCalculationMethod.mwl:
        return "prayer_method_mwl".tr();
      case PrayerCalculationMethod.ummAlQura:
        return "prayer_method_ummalqura".tr();
      case PrayerCalculationMethod.egyptian:
        return "prayer_method_egyptian".tr();
      case PrayerCalculationMethod.tehran:
        return "prayer_method_tehran".tr();
      case PrayerCalculationMethod.gulf:
        return "prayer_method_gulf".tr();
      case PrayerCalculationMethod.kuwait:
        return "prayer_method_kuwait".tr();
      case PrayerCalculationMethod.qatar:
        return "prayer_method_qatar".tr();
      case PrayerCalculationMethod.singapore:
        return "prayer_method_singapore".tr();
      case PrayerCalculationMethod.france:
        return "prayer_method_france".tr();
      case PrayerCalculationMethod.turkey:
        return "prayer_method_turkey".tr();
      case PrayerCalculationMethod.russia:
        return "prayer_method_russia".tr();
      case PrayerCalculationMethod.moonsighting:
        return "prayer_method_moonsighting".tr();
      case PrayerCalculationMethod.dubai:
        return "prayer_method_dubai".tr();
      case PrayerCalculationMethod.malaysia:
        return "prayer_method_malaysia".tr();
      case PrayerCalculationMethod.tunisia:
        return "prayer_method_tunisia".tr();
      case PrayerCalculationMethod.algeria:
        return "prayer_method_algeria".tr();
      case PrayerCalculationMethod.indonesia:
        return "prayer_method_indonesia".tr();
      case PrayerCalculationMethod.morocco:
        return "prayer_method_morocco".tr();
      case PrayerCalculationMethod.lisbon:
        return "prayer_method_lisbon".tr();
      case PrayerCalculationMethod.jordan:
        return "prayer_method_jordan".tr();
      case PrayerCalculationMethod.custom:
        return "prayer_method_custom".tr();
    }
  }

  static PrayerCalculationMethod fromName(String name) {
    return PrayerCalculationMethod.values.firstWhere(
      (method) => method.name == name,
      orElse: () => PrayerCalculationMethod.egyptian,
    );
  }

}
