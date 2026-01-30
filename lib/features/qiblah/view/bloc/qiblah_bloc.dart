import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/qiblah/domain/entity/qiblah_status_info.dart';
import 'package:tazkar/features/qiblah/domain/usecase/watch_qiblah_status.dart';

part 'qiblah_event.dart';
part 'qiblah_state.dart';

class QiblahBloc extends Bloc<QiblahEvent, QiblahState> {
  QiblahBloc(this._watchStatus) : super(QiblahState.initial()) {
    on<QiblahRequested>(_onRequested);
    on<QiblahStatusUpdated>(_onStatusUpdated);
  }

  final WatchQiblahStatus _watchStatus;
  StreamSubscription<Result<QiblahStatusInfo>>? _subscription;

  Future<void> _onRequested(
    QiblahRequested event,
    Emitter<QiblahState> emit,
  ) async {
    await _subscription?.cancel();
    emit(state.copyWith(status: QiblahStatus.loading, failure: null));

    _subscription = _watchStatus(
      event.shouldRequestPermission,
    ).listen((result) => add(QiblahStatusUpdated(result)));
  }

  void _onStatusUpdated(QiblahStatusUpdated event, Emitter<QiblahState> emit) {
    event.result.data.fold(
      (failure) =>
          emit(state.copyWith(status: QiblahStatus.failure, failure: failure)),
      (info) => emit(
        state.copyWith(
          status: info.isCheckingPermission
              ? QiblahStatus.loading
              : QiblahStatus.ready,
          info: info,
          failure: null,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
