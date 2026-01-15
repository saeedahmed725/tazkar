import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/datasource/quran_local_datasource.dart';
import 'package:tazkar/features/quran/data/datasource/quran_remote_datasource.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/correction_model.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';
import 'package:tazkar/features/quran/data/model/quran_words_model.dart';
import 'package:tazkar/features/quran/data/model/surah_info_data.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';
import 'package:tazkar/features/quran/domain/repo/mushaf_repo.dart';

class MushafRepoImp extends MushafRepo {
  final QuranLocalDataSource local;
  final QuranRemoteDatasource remote;

  MushafRepoImp({required this.local, required this.remote});

  @override
  Future<Result<bool>> findDBFile() {
    return Failure.handleOperation(
      operation: () => local.findDBFile(),
      errorMessage: 'Failed to find Quran database file',
    );
  }

  @override
  Future<Result<void>> extractZip({
    required void Function(int done, int total) onProgress,
  }) async {
    return Failure.handleOperation(
      operation: () => local.extractZip(onProgress: onProgress),
      errorMessage: 'Failed to initialize Quran database',
    );
  }

  @override
  Future<Result<({List<QuranModel> quranText, List<List<AyahGlyph>> ayahs})>>
  getQuranTextAndAyahGlyphs() async {
    try {
      final result = await Future.wait([
        local.getQuranData(),
        local.getQuranAyahGlyphs(),
      ]);
      final ayahs = result[1] as List<AyahGlyph>;
      final quran = result[0] as List<QuranModel>;
      List<List<AyahGlyph>> allMushafPagesData = [];

      for (int page = 1; page <= 604; page++) {
        allMushafPagesData.add(
          ayahs.where((ayah) => ayah.pageNumber == page).toList(),
        );
      }

      return Result(data: right((quranText: quran, ayahs: allMushafPagesData)));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<SurahModel>>> getSurahs() async {
    try {
      final ayahs = await local.getSurahs();
      return Result(data: Right(ayahs));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<JuzModel>>> getJuzs() async {
    try {
      final ayahs = await local.getJuzs();
      return Result(data: Right(ayahs));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<SurahInfo>>> getSurahsInfo() async {
    try {
      return Result(data: Right(await local.getSurahsInfoFromJson()));
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<QuranIrabWordsModel>> getQuranIrabWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    try {
      return Result(
        data: Right(
          await local.getQuranIrabWords(
            surahNumber: surahNumber,
            verseNumber: verseNumber,
            wordNumber: wordNumber,
          ),
        ),
      );
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<QuranMeaningWordsModel>> getQuranMeaningWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    try {
      return Result(
        data: Right(
          await local.getQuranMeaningWords(
            surahNumber: surahNumber,
            verseNumber: verseNumber,
            wordNumber: wordNumber,
          ),
        ),
      );
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<QuranRasmWordsModel>> getQuranRasmWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    try {
      return Result(
        data: Right(
          await local.getQuranRasmWords(
            surahNumber: surahNumber,
            verseNumber: verseNumber,
            wordNumber: wordNumber,
          ),
        ),
      );
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<QuranSarfWordsModel>> getQuranSarfWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    try {
      return Result(
        data: Right(
          await local.getQuranSarfWords(
            surahNumber: surahNumber,
            verseNumber: verseNumber,
            wordNumber: wordNumber,
          ),
        ),
      );
    } on LocalException catch (exception) {
      return Result(data: Left(LocalFailure.fromIoException(exception)));
    } catch (exception) {
      return Result(
        data: Left(LocalFailure('Unexpected error: ${exception.toString()}')),
      );
    }
  }

  @override
  Future<Result<List<CorrectionModel>>> recitation({
    required int pageNumber,
    required File file,
  }) async {
    try {
      List<CorrectionModel> correctionVerses = await remote.uploadAudioFile(
        file: file,
        pageNum: pageNumber,
      );
      return Result.success(correctionVerses);
    } on NetworkFailure catch (exception) {
      return Result(data: Left(exception));
    } on DioException catch (exception) {
      return Result.error(
        NetworkFailure(
          'Network error: ${exception.message ?? 'Unknown error'}',
        ),
      );
    } catch (exception) {
      return Result.error(
        NetworkFailure('Unexpected error: ${exception.toString()}'),
      );
    }
  }
}
