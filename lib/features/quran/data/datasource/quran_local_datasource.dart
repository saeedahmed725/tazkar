import 'dart:developer';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:tazkar/core/constants/app_shared_keys.dart';
import 'package:tazkar/core/services/db_helper.dart';
import 'package:tazkar/core/utils/helpers/shared_pref.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';
import 'package:tazkar/features/quran/data/model/quran_words_model.dart';
import 'package:tazkar/features/quran/data/model/surah_info_data.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';

import '../../../../core/services/storage_service.dart';

class QuranLocalDataSource {
  final String _assetsZipPath = 'assets/database/quran_database_v2.zip';
  final String _wordsDbName = 'words.db';

  QuranLocalDataSource() {
    if (DbHelper.instance.databasePath == null) {
      () async {
        DbHelper.instance.databasePath = await dbPath;
      }();
    }
  }

  Future<String> get dbPath async {
    final destinationPath = await StorageService.getInternalPath();
    return '$destinationPath/$_wordsDbName';
  }

  Future<bool> findDBFile() async {
    final file = await StorageService.findFile(
      fileName: _wordsDbName,
      storage: StorageType.internal,
    );
    return file != null;
  }

  Future<void> extractZip({
    required void Function(int done, int total) onProgress,
  }) async {
    final bytes = await rootBundle.load(_assetsZipPath);
    final zipData = bytes.buffer.asUint8List();

    final currentHash = sha256.convert(zipData).toString();
    final savedHash = SharedPrefs.getString(AppSharedKeys.zipHash);

    if (currentHash == savedHash) {
      log("ZIP not changed — skip extraction 🚀");
      return;
    }

    log("ZIP changed — extracting 🔥");

    final archive = ZipDecoder().decodeBytes(zipData);

    final total = archive.length;
    int done = 0;

   try{
     for (final file in archive) {
       if (file.isFile) {
         log(file.name);
         await StorageService.save(
           storage: StorageType.internal,
           fileName: file.name,
           bytes: file.content,
         );
       }
       done++;
       onProgress(done, total);
     }
   }catch (e,s){
      log("Error during unzip", error: e, stackTrace: s);
      rethrow;
   }

    await SharedPrefs.setString(AppSharedKeys.zipHash, currentHash);
  }

  ///  if any error occurs during unzip process, delete the database
  Future<void> deleteDB() async {}

  // Get all ayahs quran
  Future<List<QuranModel>> getQuranData() async {
    return DbHelper.instance.readDatabaseFile<List<QuranModel>>(
      table: "Quran",
      fromJson: (json) {
        List<dynamic> data = json;
        return data.map((d) => QuranModel.fromMap(d)).toList();
      },
    );
  }

  Future<List<JuzModel>> getJuzs() async {
    return DbHelper.instance.readDatabaseFile<List<JuzModel>>(
      table: "Juza",
      fromJson: (json) {
        List<dynamic> data = json;
        log("Juzs: $data");
        return data.map((d) => JuzModel.fromJson(d)).toList();
      },
    );
  }

  // Get all ayahs surah info
  Future<List<SurahInfo>> getSurahsInfoFromJson() async {
    return DbHelper.instance.readDatabaseJsonFile<List<SurahInfo>>(
      fileName: "/albitaqat.json",
      fromJson: (json) {
        List<dynamic> data = json[0];
        return data.map((d) => SurahInfo.fromJson(d)).toList();
      },
    );
  }

  // Get all ayahs glyphs
  Future<List<AyahGlyph>> getQuranAyahGlyphs() async {
    return DbHelper.instance.readDatabaseFile<List<AyahGlyph>>(
      table: 'word_glyph',
      fromJson: (json) => (json as List)
          .map<AyahGlyph>((map) => AyahGlyph.fromMap(map))
          .toList(),
    );
  }

  // Get all surah infos
  Future<List<SurahModel>> getSurahs() async {
    return DbHelper.instance.readDatabaseFile<List<SurahModel>>(
      table: 'Sora',
      fromJson: (json) => (json as List)
          .map<SurahModel>((map) => SurahModel.fromJson(map))
          .toList(),
    );
  }

  // Get all ayahs irab
  Future<QuranIrabWordsModel> getQuranIrabWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    return DbHelper.instance.readDatabaseFile<QuranIrabWordsModel>(
      table: 'word_irab',
      where: 'surahNo = ? AND ayahNo = ? AND wordNo = ?',
      whereArgs: [surahNumber, verseNumber, wordNumber],
      fromJson: (json) => QuranIrabWordsModel.fromJson(json[0]),
    );
  }

  // Get all ayahs rasm
  Future<QuranRasmWordsModel> getQuranRasmWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    return DbHelper.instance.readDatabaseFile<QuranRasmWordsModel>(
      table: 'word_rasm',
      where: 'surahNo = ? AND ayahNo = ? AND wordNo = ?',
      whereArgs: [surahNumber, verseNumber, wordNumber],
      fromJson: (json) => QuranRasmWordsModel.fromJson(json[0]),
    );
  }

  // Get all ayahs meaning
  Future<QuranMeaningWordsModel> getQuranMeaningWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    return DbHelper.instance.readDatabaseFile<QuranMeaningWordsModel>(
      table: 'word_meaning',
      where: 'surahNo = ? AND ayahNo = ? AND wordNo = ?',
      whereArgs: [surahNumber, verseNumber, wordNumber],
      fromJson: (json) => QuranMeaningWordsModel.fromJson(json[0]),
    );
  }

  // Get all ayahs sarf
  Future<QuranSarfWordsModel> getQuranSarfWords({
    required int surahNumber,
    required int verseNumber,
    required int wordNumber,
  }) async {
    return DbHelper.instance.readDatabaseFile<QuranSarfWordsModel>(
      table: 'word_sarf',
      where: 'surahNo = ? AND ayahNo = ? AND wordNo = ?',
      whereArgs: [surahNumber, verseNumber, wordNumber],
      fromJson: (json) => QuranSarfWordsModel.fromJson(json[0]),
    );
  }
}
