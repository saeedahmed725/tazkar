import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';

enum LatitudeAdjustmentMethod {
  middleOfTheNight(1),
  oneSeventh(2),
  angleBased(3);

  final int value;

  const LatitudeAdjustmentMethod(this.value);

  String get label {
    switch (this) {
      case LatitudeAdjustmentMethod.middleOfTheNight:
        return 'latitudeAdjustment.middleOfTheNight'.tr();
      case LatitudeAdjustmentMethod.oneSeventh:
        return 'latitudeAdjustment.oneSeventh'.tr();
      case LatitudeAdjustmentMethod.angleBased:
        return 'latitudeAdjustment.angleBased'.tr();
    }
  }

  static LatitudeAdjustmentMethod? fromName(String name) {
    return LatitudeAdjustmentMethod.values.firstWhereOrNull(
      (method) => method.name == name,
    );
  }
}
