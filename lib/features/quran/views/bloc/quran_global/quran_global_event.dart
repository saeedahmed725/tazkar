part of 'quran_global_bloc.dart';

@immutable
sealed class QuranGlobalEvent {}

class GetQuranAndAyahGlyphs extends QuranGlobalEvent {
  GetQuranAndAyahGlyphs();
}
