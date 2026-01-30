part of 'qiblah_bloc.dart';

enum QiblahStatus { initial, loading, ready, failure }

class QiblahState extends Equatable {
  const QiblahState({
    required this.status,
    this.info,
    this.failure,
  });

  factory QiblahState.initial() => const QiblahState(
    status: QiblahStatus.initial,
  );

  final QiblahStatus status;
  final QiblahStatusInfo? info;
  final Failure? failure;

  QiblahState copyWith({
    QiblahStatus? status,
    QiblahStatusInfo? info,
    Failure? failure,
  }) {
    return QiblahState(
      status: status ?? this.status,
      info: info ?? this.info,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, info, failure];
}
