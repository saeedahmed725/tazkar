import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/core/utils/helpers/usecase.dart';
import 'package:tazkar/features/qiblah/domain/entity/qiblah_status_info.dart';
import 'package:tazkar/features/qiblah/domain/repo/qiblah_repo.dart';

class WatchQiblahStatus
    extends UseCase<Stream<Result<QiblahStatusInfo>>, bool> {
  const WatchQiblahStatus(this._repo);

  final QiblahRepo _repo;

  @override
  Stream<Result<QiblahStatusInfo>> call([bool shouldRequestPermission = true]) {
    return _repo.watchStatus(shouldRequestPermission: shouldRequestPermission);
  }
}
