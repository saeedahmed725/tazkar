part of 'juz_infos_bloc.dart';

@immutable
sealed class JuzInfosEvent {}


class GetJuzInfos extends JuzInfosEvent {
  GetJuzInfos();
}