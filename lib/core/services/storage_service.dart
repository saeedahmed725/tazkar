import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/app_shared_keys.dart';
import '../constants/app_static.dart';
import '../utils/errors/exceptions.dart';
import '../utils/errors/failure.dart';
import '../utils/helpers/shared_pref.dart';

enum StorageType { internal, external }

class StorageService {
  static Future<bool> requestAllStoragePermissions() async {
    final externalStorageIsGranted =
        await Permission.manageExternalStorage.isGranted;
    final storageIsGranted = await Permission.storage.isGranted;
    if (externalStorageIsGranted || storageIsGranted) {
      return true;
    }
    var status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    return externalStorageIsGranted || storageIsGranted;
  }

  /// ================================
  /// INTERNAL STORAGE – iOS + Android
  /// ================================
  static Future<String> getInternalPath() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, AppStatic.appFolder);
    final folder = Directory(path);
    if (!(await folder.exists())) {
      await folder.create(recursive: true);
    }
    return folder.path;
  }

  /// Save a file internally
  static Future<File> saveInternal({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final folder = await getInternalPath();
    final file = File(join(folder, fileName));
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<bool> isFileExists({
    required String fileName,
    required StorageType storage,
  }) async {
    final folder = await switch (storage) {
      StorageType.internal => getInternalPath(),
      StorageType.external => getExternalPath(),
    };
    final file = File(join(folder, fileName));
    return file.exists();
  }

  static Future<File?> findFile({
    required String fileName,
    required StorageType storage,
  }) async {
    final folder = await switch (storage) {
      StorageType.internal => getInternalPath(),
      StorageType.external => getExternalPath(),
    };
    final file = File(join(folder, fileName));
    if (file.existsSync()) {
      return file;
    }
    return null;
  }

  /// ==================================
  /// EXTERNAL STORAGE – ANDROID ONLY (SAF)
  /// ==================================
  static String getSavedExternalUri() {
    return SharedPrefs.getString(AppSharedKeys.externalPathKey);
  }

  static Future<void> savedExternalUri(String value) async {
    return await SharedPrefs.setString(AppSharedKeys.externalPathKey, value);
  }

  /// User selects external folder (Downloads / Documents)
  static Future<String?> pickExternalFolder() async {
    final path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: "Select Download Folder",
    );
    if (path != null) {
      await savedExternalUri(path);
    }
    return path;
  }

  static Future<String> getExternalPath() async {
    if (Platform.isIOS) {
      return getInternalPath();
    }

    if (!Platform.isAndroid) {
      throw Exception("External storage not supported on iOS");
    }

    if (!(await requestAllStoragePermissions())) {
      throw LocalException(
        "Permission not granted",
        code: LocalFailure.STORAGE_PERMISSION_ERROR_CODE,
      );
    }

    String? uri = getSavedExternalUri();
    // If user never selected a folder → open SAF folder picker
    if (uri.isEmpty) {
      uri = await pickExternalFolder();
      log(uri.toString());
      if (uri == null) throw Exception("External storage not available");
    }
    return uri;
  }

  /// Save file to external folder
  static Future<File?> saveExternal({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final uri = await getExternalPath();
    await FilePicker.platform.saveFile(
      initialDirectory: uri,
      fileName: fileName,
      bytes: bytes,
    );

    return File(join(uri, fileName));
  }

  /// =======================================================
  /// UNIVERSAL SAVE – save based on StorageType enum
  /// =======================================================
  static Future<File?> save({
    required StorageType storage,
    required String fileName,
    required Uint8List bytes,
  }) async {
    if (storage == StorageType.internal) {
      return saveInternal(fileName: fileName, bytes: bytes);
    } else {
      return saveExternal(fileName: fileName, bytes: bytes);
    }
  }
}
