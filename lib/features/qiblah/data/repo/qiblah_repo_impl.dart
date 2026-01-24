import 'package:geolocator/geolocator.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/qiblah/data/source/qiblah_location_source.dart';
import 'package:tazkar/features/qiblah/domain/entity/qiblah_status_info.dart';
import 'package:tazkar/features/qiblah/domain/repo/qiblah_repo.dart';

class QiblahRepoImpl implements QiblahRepo {
  QiblahRepoImpl(this._source);

  final QiblahLocationSource _source;

  @override
  Stream<Result<QiblahStatusInfo>> watchStatus({
    bool shouldRequestPermission = true,
  }) {
    return Failure.handleStreamOperation(
      operation: () => _statusStream(shouldRequestPermission),
      errorMessage: 'Failed to check Qiblah status',
    );
  }

  Stream<QiblahStatusInfo> _statusStream(bool shouldRequestPermission) async* {
    final isSupported = await _source.isDeviceSupported();
    if (!isSupported) {
      throw LocalException(
        'Your device does not support the compass sensor.',
        code: LocalFailure.GENERIC_ERROR_CODE,
      );
    }

    var status = await _source.checkLocationStatus();

    if (!status.enabled) {
      throw LocalException(
        'Location services are disabled.',
        code: LocalFailure.LOCATION_SETTINGS_ERROR_CODE,
      );
    }

    if (status.status == LocationPermission.denied && shouldRequestPermission) {
      yield QiblahStatusInfo(
        isDeviceSupported: isSupported,
        locationStatus: status,
        isCheckingPermission: true,
      );
      await _source.requestPermissions();
      status = await _source.checkLocationStatus();
    }

    if (status.status == LocationPermission.denied ||
        status.status == LocationPermission.deniedForever) {
      throw LocalException(
        'Location permission denied',
        code: LocalFailure.LOCATION_PERMISSION_ERROR_CODE,
      );
    }

    yield QiblahStatusInfo(
      isDeviceSupported: isSupported,
      locationStatus: status,
      isCheckingPermission: false,
    );
  }
}
