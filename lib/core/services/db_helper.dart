import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tazkar/core/services/shared_prefs.dart';

import '../constants/app_apis.dart';
import '../utils/errors/error_code.dart';
import '../utils/errors/exceptions.dart';
import 'dio_factory.dart';
import 'network_client.dart';

class DbHelper {
  DbHelper._internal();

  static final DbHelper instance = DbHelper._internal();

  String? temp;
  String? databasePath;

  // String? tafasserPath;
  // String? hadithPath;
  Database? _database;

  final String _dbPathsName = 'db_paths';
  final String _wordsDbName = 'words.db';
  final String _quranDatabaseV2 = 'quran_database_v2.zip';

  Future<bool> downloadDatabase(
      void Function(int count, int total)? onReceiveProgress) async {
    log('Downloading database...', name: 'Downloading database');
    String tempDBZipPath = '$temp/$_quranDatabaseV2';
    final dio = DioFactory.getDio(baseUrl: AppApis.baseDownloadUrl);
    final response = await NetworkClient(dio)
        .download(_quranDatabaseV2, tempDBZipPath, onReceiveProgress);
    DioFactory.addDioHeaders(AppApis.baseUrl);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  bool checkDatabaseZipFileIsExist() =>
      File('$temp/$_quranDatabaseV2').existsSync();

  Future<Unit> checkDatabaseIsUnzipOrNot() async {
    try {
      List<String> dbPathsName = SharedPrefs.getStringList(_dbPathsName);
      if (dbPathsName.isEmpty) {
        List<String> fileNames = await unzipDatabaseZipFileFromTempFiles();
        SharedPrefs.setStringList(_dbPathsName, fileNames);
      } else {
        for (String path in dbPathsName) {
          File file = File(path);
          if (!file.existsSync()) {
            List<String> fileNames = await unzipDatabaseZipFileFromTempFiles();
            SharedPrefs.setStringList(_dbPathsName, fileNames);
            break;
          }
        }
      }
    } catch (e) {
      throw LocalException(e.toString(),
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    }
    return unit;
  }

  Future<List<String>> unzipDatabaseZipFileFromTempFiles() async {
    log('Unzipping files...', name: 'Unzipping files');
    String tempDBZipPath = '$temp/$_quranDatabaseV2';
    List<String> fileNames = [];
    File zipFile = File(tempDBZipPath);
    List<int> bytes = await zipFile.readAsBytes();
    Archive archive = ZipDecoder().decodeBytes(bytes);

    for (ArchiveFile file in archive) {
      if (file.isFile) {
        String filename = '$databasePath/${file.name}';
        fileNames.add(filename);
        File outFile = File(filename);
        if (!outFile.existsSync()) {
          await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content as List<int>);
          log('ملف JSON: $filename');
          log('Unzipping file $filename: done.', name: 'Unzipping files');
        }
      }
    }
    return fileNames;
  }

  Future<void> initDBDirectories() async {
    final paths = await Future.wait([
      getDatabasesPath(),
      getTemporaryDirectory(),
    ]);
    databasePath = paths[0] as String;
    temp = "${(paths[1] as Directory).path}/temp";
  }

  Future<void> deleteDB() async {
    log('Deleting temporary files...  $databasePath', name: 'Deleting files');
    if (databasePath != null) {
      final directory = Directory(databasePath!);
      if (await directory.exists()) {
        await directory.delete(recursive: true);
        SharedPrefs.remove(_dbPathsName);
        log('Temporary files deleted due to error.');
      }
    }
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    return await openDatabase('$databasePath/$_wordsDbName');
  }

  Future<T> readDatabaseFile<T>({
    required String table,
    String? where,
    String? orderBy,
    List<int?>? whereArgs,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final db = await database;
      log('Open Database: ${db.isOpen} Reading database file: $table',
          name: 'Db Helper');
      final List<Map<String, Object?>> data = await db.query(
        table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );
      return fromJson(data);
    } catch (e) {
      log("Error loading data: $e", name: "Db Helper");
      throw LocalException(e.toString(),
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    }
  }

  Future<T> readDatabaseJsonFile<T>(
      {required String fileName,
        required T Function(dynamic json) fromJson,
        dynamic Function(dynamic error)? onError,
        String? specificPath}) async {
    try {
      File file = File((specificPath ?? databasePath!) + fileName);
      String fileContents = await file.readAsString();
      final jsonData = json.decode(fileContents);
      return fromJson(jsonData);
    } catch (e) {
      onError?.call(e);
      log("Error loading data: $e", name: "Db Helper");
      throw LocalException(e.toString(),
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    }
  }
}