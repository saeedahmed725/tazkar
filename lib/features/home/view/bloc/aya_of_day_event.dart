part of 'aya_of_day_bloc.dart';

@immutable
sealed class AyaOfDayEvent {
  const AyaOfDayEvent();
}

class AyaOfDayRequested extends AyaOfDayEvent {
  const AyaOfDayRequested();
}

class AyaOfDayRefreshed extends AyaOfDayEvent {
  const AyaOfDayRefreshed();
}
