part of 'qiblah_bloc.dart';

abstract class QiblahEvent extends Equatable {
  const QiblahEvent();

  @override
  List<Object?> get props => [];
}

class QiblahRequested extends QiblahEvent {
  const QiblahRequested({this.shouldRequestPermission = true});

  final bool shouldRequestPermission;
}

class QiblahStatusUpdated extends QiblahEvent {
  const QiblahStatusUpdated(this.result);

  final Result<QiblahStatusInfo> result;

  @override
  List<Object?> get props => [result];
}
