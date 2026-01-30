part of 'prayer_bloc.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();

  @override
  List<Object?> get props => [];
}

class PrayerRequested extends PrayerEvent {
  final bool shouldRefresh;

  const PrayerRequested({this.shouldRefresh = false});
}

class PrayerLocationChanged extends PrayerEvent {
  final String locationName;

  const PrayerLocationChanged({required this.locationName});
}

class PrayerTicked extends PrayerEvent {
  const PrayerTicked(this.now);

  final DateTime now;

  @override
  List<Object?> get props => [now];
}
