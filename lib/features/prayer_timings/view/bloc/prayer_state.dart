part of 'prayer_bloc.dart';

enum PrayerStatus { initial, loading, success, failure }

class PrayerState extends Equatable {
  const PrayerState({
    required this.status,
    required this.todayTimes,
    required this.progress,
    this.calendar,
    this.query,
    this.currentPrayer,
    this.nextPrayer,
    this.nextPrayerTime,
    this.countdown,
    this.failure,
  });

  factory PrayerState.initial() => const PrayerState(
    status: PrayerStatus.initial,
    todayTimes: <PrayerTimeView>[],
    progress: 0.0,
  );

  final PrayerStatus status;
  final PrayerTimingsModel? calendar;
  final PrayerQuery? query;
  final List<PrayerTimeView> todayTimes;
  final TimingProps? currentPrayer;
  final TimingProps? nextPrayer;
  final DateTime? nextPrayerTime;
  final String? countdown;
  final Failure? failure;

  final double progress;

  PrayerState copyWith({
    PrayerStatus? status,
    PrayerTimingsModel? calendar,
    PrayerQuery? query,
    double? progress,
    List<PrayerTimeView>? todayTimes,
    TimingProps? currentPrayer,
    TimingProps? nextPrayer,
    DateTime? nextPrayerTime,
    String? countdown,
    Failure? message,
  }) {
    return PrayerState(
      progress: progress ?? this.progress,
      status: status ?? this.status,
      calendar: calendar ?? this.calendar,
      query: query ?? this.query,
      todayTimes: todayTimes ?? this.todayTimes,
      currentPrayer: currentPrayer ?? this.currentPrayer,
      nextPrayer: nextPrayer ?? this.nextPrayer,
      nextPrayerTime: nextPrayerTime ?? this.nextPrayerTime,
      countdown: countdown ?? this.countdown,
      failure: message ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
    status,
    calendar,
    query,
    todayTimes,
    currentPrayer,
    nextPrayer,
    nextPrayerTime,
    countdown,
    failure,
  ];
}

class PrayerSchedule extends Equatable {
  const PrayerSchedule({
    required this.todayTimes,
    required this.currentPrayer,
    required this.nextPrayer,
    required this.nextPrayerTime,
    required this.countdown,
  });

  final List<PrayerTimeView> todayTimes;
  final TimingProps? currentPrayer;
  final TimingProps? nextPrayer;
  final DateTime? nextPrayerTime;
  final Duration? countdown;

  @override
  List<Object?> get props => [
    todayTimes,
    currentPrayer,
    nextPrayer,
    nextPrayerTime,
    countdown,
  ];
}

class PrayerTimeView extends Equatable {
  const PrayerTimeView(this.prayer, this.time);

  final TimingProps prayer;
  final DateTime time;

  @override
  List<Object?> get props => [prayer, time];
}
