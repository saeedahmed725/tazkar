part of 'prayer_bloc.dart';

enum PrayerStatus { initial, loading, success, failure }

class PrayerState extends Equatable {
  const PrayerState({
    required this.status,
    required this.todayTimes,
    this.calendar,
    this.query,
    this.currentPrayer,
    this.nextPrayer,
    this.nextPrayerTime,
    this.countdown,
    this.message,
  });

  factory PrayerState.initial() => const PrayerState(
        status: PrayerStatus.initial,
        todayTimes: <PrayerTimeView>[],
      );

  final PrayerStatus status;
  final PrayerTimingsModel? calendar;
  final PrayerQuery? query;
  final List<PrayerTimeView> todayTimes;
  final TimingProps? currentPrayer;
  final TimingProps? nextPrayer;
  final DateTime? nextPrayerTime;
  final String? countdown;
  final String? message;

  PrayerState copyWith({
    PrayerStatus? status,
    PrayerTimingsModel? calendar,
    PrayerQuery? query,
    List<PrayerTimeView>? todayTimes,
    TimingProps? currentPrayer,
    TimingProps? nextPrayer,
    DateTime? nextPrayerTime,
    String? countdown,
    String? message,
  }) {
    return PrayerState(
      status: status ?? this.status,
      calendar: calendar ?? this.calendar,
      query: query ?? this.query,
      todayTimes: todayTimes ?? this.todayTimes,
      currentPrayer: currentPrayer ?? this.currentPrayer,
      nextPrayer: nextPrayer ?? this.nextPrayer,
      nextPrayerTime: nextPrayerTime ?? this.nextPrayerTime,
      countdown: countdown ?? this.countdown,
      message: message ?? this.message,
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
        message,
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
