import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

import '../utils/errors/exceptions.dart';
import '../utils/errors/failure.dart';

class DbHelper {
  DbHelper._internal();

  static final DbHelper instance = DbHelper._internal();

  String? databasePath;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (databasePath == null) {
      throw LocalException(
        'Database not found',
        code: LocalFailure.DATABASE_ERROR_CODE,
      );
    }
    return await openDatabase(databasePath!);
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
      log(
        'Open Database: ${db.isOpen} Reading database file: $table',
        name: 'Db Helper',
      );
      final List<Map<String, Object?>> data = await db.query(
        table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );
      return fromJson(data);
    } catch (e) {
      log("Error loading data: $e", name: "Db Helper");
      throw LocalException(
        e.toString(),
        code: LocalFailure.DATABASE_ERROR_CODE,
      );
    }
  }

  Future<T> readDatabaseJsonFile<T>({
    required String fileName,
    required T Function(dynamic json) fromJson,
    dynamic Function(dynamic error)? onError,
    String? specificPath,
  }) async {
    try {
      File file = File((specificPath ?? databasePath!) + fileName);
      String fileContents = await file.readAsString();
      final jsonData = json.decode(fileContents);
      return fromJson(jsonData);
    } catch (e) {
      onError?.call(e);
      log("Error loading data: $e", name: "Db Helper");
      throw LocalException(
        e.toString(),
        code: LocalFailure.DATABASE_ERROR_CODE,
      );
    }
  }
}
