import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/features/prayer_timings/data/enums/timing_props.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_query.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_timings_model.dart';
import 'package:tazkar/features/prayer_timings/data/repo/prayer_timings_repo.dart';

part 'prayer_event.dart';
part 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerBloc(this._repo) : super(PrayerState.initial()) {
    on<PrayerRequested>(_onRequested);
    on<PrayerTicked>(_onTicked);
  }

  final PrayerTimingsRepo _repo;
  StreamSubscription<int>? _ticker;

  Future<void> _onRequested(
    PrayerRequested event,
    Emitter<PrayerState> emit,
  ) async {
    _ticker?.cancel();
    emit(state.copyWith(status: PrayerStatus.loading, message: null));

    final result = await _repo.getPrayerTimings();
    result.data.fold(
      (failure) => emit(
        state.copyWith(status: PrayerStatus.failure, message: failure.message),
      ),
      (calendar) {
        final schedule = _buildSchedule(calendar, DateTime.now());
        _startTicker();
        emit(
          state.copyWith(
            status: PrayerStatus.success,
            calendar: calendar,
            todayTimes: schedule.todayTimes,
            currentPrayer: schedule.currentPrayer,
            nextPrayer: schedule.nextPrayer,
            nextPrayerTime: schedule.nextPrayerTime,
            countdown: _formatCountdown(schedule.countdown),
          ),
        );
      },
    );
  }

  void _onTicked(PrayerTicked event, Emitter<PrayerState> emit) {
    if (state.calendar == null) return;

    final schedule = _buildSchedule(state.calendar!, event.now);
    final newCountdown = _formatCountdown(schedule.countdown);
    final timesChanged = !listEquals(state.todayTimes, schedule.todayTimes);

    if (state.countdown != newCountdown ||
        state.currentPrayer != schedule.currentPrayer ||
        state.nextPrayer != schedule.nextPrayer ||
        timesChanged) {
      emit(
        state.copyWith(
          todayTimes: timesChanged ? schedule.todayTimes : null,
          currentPrayer: schedule.currentPrayer,
          nextPrayer: schedule.nextPrayer,
          nextPrayerTime: schedule.nextPrayerTime,
          countdown: newCountdown,
        ),
      );
    }
  }

  String _formatCountdown(Duration? duration) {
    if (duration == null) return '--:--:--';
    final h = duration.inHours;
    final m = duration.inMinutes % 60;
    final s = duration.inSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }

  PrayerSchedule _buildSchedule(PrayerTimingsModel calendar, DateTime now) {
    final today = _findDay(calendar, now);
    final tomorrow = _findDay(calendar, now.add(const Duration(days: 1)));

    final todayTimes = today != null
        ? _parsePrayerTimes(today, now)
        : <PrayerTimeView>[];
    final tomorrowTimes = tomorrow != null
        ? _parsePrayerTimes(tomorrow, now.add(const Duration(days: 1)))
        : <PrayerTimeView>[];

    final allTimes = [...todayTimes, ...tomorrowTimes];

    PrayerTimeView? next;
    PrayerTimeView? current;

    for (final timeView in allTimes) {
      if (timeView.time.isAfter(now)) {
        next = timeView;
        break;
      }
      current = timeView;
    }

    final countdown = next?.time.difference(now) ?? Duration.zero;

    return PrayerSchedule(
      todayTimes: todayTimes,
      currentPrayer: current?.prayer,
      nextPrayer: next?.prayer,
      nextPrayerTime: next?.time,
      countdown: countdown.isNegative ? Duration.zero : countdown,
    );
  }

  List<PrayerTimeView> _parsePrayerTimes(PrayerDay day, DateTime date) {
    final times = [
      PrayerTimeView(TimingProps.fajr, _parseTime(day.timings.fajr, date)),
      PrayerTimeView(TimingProps.dhuhr, _parseTime(day.timings.dhuhr, date)),
      PrayerTimeView(TimingProps.asr, _parseTime(day.timings.asr, date)),
      PrayerTimeView(
        TimingProps.maghrib,
        _parseTime(day.timings.maghrib, date),
      ),
      PrayerTimeView(TimingProps.isha, _parseTime(day.timings.isha, date)),
    ];
    times.sort((a, b) => a.time.compareTo(b.time));
    return times;
  }

  DateTime _parseTime(String raw, DateTime date) {
    try {
      return DateTime.parse(raw).toLocal();
    } catch (e) {
      final parts = raw.split(' ').first.split('(').first.split(':');
      if (parts.length < 2) return DateTime(date.year, date.month, date.day);

      final hour = int.tryParse(parts[0]) ?? 0;
      final minute =
          int.tryParse(parts[1].replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

      return DateTime(date.year, date.month, date.day, hour, minute);
    }
  }

  PrayerDay? _findDay(PrayerTimingsModel calendar, DateTime date) {
    final target = DateTime(date.year, date.month, date.day);

    for (final monthDays in calendar.data.values) {
      for (final day in monthDays) {
        try {
          final millis = int.parse(day.date.timestamp) * 1000;
          final dayDate = DateTime.fromMillisecondsSinceEpoch(
            millis,
            isUtc: true,
          ).toLocal();
          final dayOnly = DateTime(dayDate.year, dayDate.month, dayDate.day);

          if (dayOnly == target) return day;
        } catch (e) {
          continue;
        }
      }
    }
    return null;
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Stream.periodic(
      const Duration(seconds: 1),
      (s) => s,
    ).listen((_) => add(PrayerTicked(DateTime.now())));
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
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
