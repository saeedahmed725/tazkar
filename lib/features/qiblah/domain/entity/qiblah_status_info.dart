import 'package:equatable/equatable.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class QiblahStatusInfo extends Equatable {
  const QiblahStatusInfo({
    required this.isDeviceSupported,
    required this.locationStatus,
    required this.isCheckingPermission,
  });

  final bool isDeviceSupported;
  final LocationStatus locationStatus;
  final bool isCheckingPermission;

  bool get isLocationEnabled => locationStatus.enabled;

  bool get isPermissionGranted =>
      locationStatus.status == LocationPermission.always ||
      locationStatus.status == LocationPermission.whileInUse;

  @override
  List<Object?> get props => [
    isDeviceSupported,
    locationStatus.enabled,
    locationStatus.status,
    isCheckingPermission,
  ];
}
