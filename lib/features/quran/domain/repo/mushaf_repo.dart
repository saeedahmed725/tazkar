import 'dart:io';

import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/correction_model.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';
import 'package:tazkar/features/quran/data/model/quran_words_model.dart';
import 'package:tazkar/features/quran/data/model/surah_info_data.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';

abstract class MushafRepo {
  Future<Result<bool>> findDBFile();

  Future<Result<void>> extractZip({
    required void Function(int done, int total) onProgress,
  });

  Future<Result<({List<QuranModel> quranText, List<List<AyahGlyph>> ayahs})>>
  getQuranTextAndAyahGlyphs();

  Future<Result<List<SurahInfo>>> getSurahsInfo();

  Future<Result<List<SurahModel>>> getSurahs();

  Future<Result<List<JuzModel>>> getJuzs();

  Future<Result<QuranIrabWordsModel>> getQuranIrabWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  });

  Future<Result<QuranRasmWordsModel>> getQuranRasmWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  });

  Future<Result<QuranMeaningWordsModel>> getQuranMeaningWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  });

  Future<Result<QuranSarfWordsModel>> getQuranSarfWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  });

  Future<Result<List<CorrectionModel>>> recitation({
    required int pageNumber,
    required File file,
  });
}
