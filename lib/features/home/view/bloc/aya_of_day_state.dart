part of 'aya_of_day_bloc.dart';

enum AyaOfDayStatus { initial, loading, success, failure }

class AyaOfDayState extends Equatable {
  const AyaOfDayState({required this.status, this.aya, this.message});

  factory AyaOfDayState.initial() =>
      const AyaOfDayState(status: AyaOfDayStatus.initial);

  final AyaOfDayStatus status;
  final AyaOfDayEntity? aya;
  final String? message;

  AyaOfDayState copyWith({
    AyaOfDayStatus? status,
    AyaOfDayEntity? aya,
    String? message,
  }) {
    return AyaOfDayState(
      status: status ?? this.status,
      aya: aya ?? this.aya,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, aya, message];
}
