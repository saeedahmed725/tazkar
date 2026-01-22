part of 'prayer_bloc.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();
}

class PrayerRequested extends PrayerEvent {
  const PrayerRequested({this.query});

  final PrayerQuery? query;

  @override
  List<Object?> get props => [query];
}

class PrayerTicked extends PrayerEvent {
  const PrayerTicked(this.now);

  final DateTime now;

  @override
  List<Object?> get props => [now];
}
