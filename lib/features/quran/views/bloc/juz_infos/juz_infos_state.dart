part of 'juz_infos_bloc.dart';

@immutable
sealed class JuzInfosState {}

final class JuzInfosLoading extends JuzInfosState {}

final class JuzInfosLoaded extends JuzInfosState {
  final List<JuzModel> juzInfos;

  JuzInfosLoaded({required this.juzInfos});
}

final class JuzInfosError extends JuzInfosState {
  final Failure failure;

  JuzInfosError({required this.failure});
}
