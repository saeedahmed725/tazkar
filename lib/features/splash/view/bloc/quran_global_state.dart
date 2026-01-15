part of 'quran_global_bloc.dart';

enum QuranGlobalStatus { initial, unzipping, loaded, error }

class QuranGlobalState {
  final QuranGlobalStatus status;

  final List<List<AyahGlyph>> ayahGlyphs;
  final List<QuranModel> quranText;
  final String zipProgress;
  final Failure? failure;

  const QuranGlobalState({
    this.status = QuranGlobalStatus.initial,
    this.ayahGlyphs = const [],
    this.quranText = const [],
    this.zipProgress = '0',
    this.failure,
  });

  QuranGlobalState copyWith({
    QuranGlobalStatus? status,
    List<List<AyahGlyph>>? ayahGlyphs,
    List<QuranModel>? quranText,
    String? zipProgress,
    Failure? failure,
  }) {
    return QuranGlobalState(
      status: status ?? this.status,
      ayahGlyphs: ayahGlyphs ?? this.ayahGlyphs,
      quranText: quranText ?? this.quranText,
      zipProgress: zipProgress ?? this.zipProgress,
      failure: failure ?? this.failure,
    );
  }

  bool get hasError => failure != null;

  bool get isLoaded => status == QuranGlobalStatus.loaded;


  bool get isUnzipping => status == QuranGlobalStatus.unzipping;

  bool get isError => status == QuranGlobalStatus.error;
}
