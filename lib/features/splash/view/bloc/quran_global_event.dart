part of 'quran_global_bloc.dart';

@immutable
sealed class QuranGlobalEvent {}

class InitDB extends QuranGlobalEvent {}

class ExtractZip extends QuranGlobalEvent {}

class GetQuranAndAyahGlyphs extends QuranGlobalEvent {}
