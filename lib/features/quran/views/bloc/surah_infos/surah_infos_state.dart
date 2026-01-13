part of 'surah_infos_bloc.dart';

@immutable
sealed class SurahInfosState {}

final class SurahInfosLoading extends SurahInfosState {}

final class SurahInfosLoaded extends SurahInfosState {
  final List<SurahModel> surahInfos;

  SurahInfosLoaded({required this.surahInfos});
}

final class SurahInfosError extends SurahInfosState {
  final Failure failure;

  SurahInfosError({required this.failure});
}
