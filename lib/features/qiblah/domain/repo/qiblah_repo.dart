import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/qiblah/domain/entity/qiblah_status_info.dart';

abstract class QiblahRepo {
  Stream<Result<QiblahStatusInfo>> watchStatus({
    bool shouldRequestPermission = true,
  });
}
