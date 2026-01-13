part of 'quran_global_bloc.dart';

@immutable
sealed class QuranGlobalState {}

final class AyahGlyphsLoading extends QuranGlobalState {}

final class QuranTextAndAyahGlyphsLoaded extends QuranGlobalState {
  final List<List<AyahGlyph>> ayahGlyphs;
  final List<QuranModel> quranText;

  QuranTextAndAyahGlyphsLoaded(
      {required this.ayahGlyphs, required this.quranText});
}


final class AyahGlyphsError extends QuranGlobalState {
  final Failure failure;

  AyahGlyphsError(this.failure);
}
