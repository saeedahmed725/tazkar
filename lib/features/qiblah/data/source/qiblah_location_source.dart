import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblahLocationSource {
  Future<bool> isDeviceSupported() async {
    return (await FlutterQiblah.androidDeviceSensorSupport()) ?? false;
  }

  Future<LocationStatus> checkLocationStatus() {
    return FlutterQiblah.checkLocationStatus();
  }

  Future<void> requestPermissions() async {
    await FlutterQiblah.requestPermissions();
  }
}
