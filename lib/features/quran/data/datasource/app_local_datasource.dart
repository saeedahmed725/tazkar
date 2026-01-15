import 'dart:developer';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:tazkar/core/constants/app_shared_keys.dart';
import 'package:tazkar/core/utils/helpers/shared_pref.dart';

import '../../../../core/services/storage_service.dart';

class AppLocalDatasource {
  final String _assetsZipPath = 'assets/database/quran_database_v2.zip';
  final String _wordsDbName = 'words.db';

  Future<void> checkDatabaseIsUnzipOrNot() async {
    final file = await StorageService.findFile(
      fileName: _wordsDbName,
      storage: StorageType.internal,
    );

    if (file == null) {
      log("Words DB not found — extracting ZIP 🔥");
      await extractZip(
        destinationPath: await StorageService.getInternalPath(),
        onProgress: (done, total) {
          log("Extracting ZIP: $done / $total");
        },
      );
    } else {
      log("DB found 🚀");
    }
  }

  Future<void> extractZip({
    required String destinationPath,
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

    for (final file in archive) {
      final filePath = '$destinationPath/${file.name}';

      if (file.isFile) {
        await StorageService.save(
          storage: StorageType.internal,
          fileName: file.name,
          bytes: file.content,
        );
      } else {
        await Directory(filePath).create(recursive: true);
      }

      done++;
      onProgress(done, total);
    }

    await SharedPrefs.setString(AppSharedKeys.zipHash, currentHash);
  }
}
