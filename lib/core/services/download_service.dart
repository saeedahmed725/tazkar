import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'storage_service.dart';

class DownloadService {
  final Dio _dio;

  DownloadService(Dio dio) : _dio = dio;

  Future<void> download({
    required String url,
    required String fileName,
    StorageType storage = StorageType.external,
    ProgressCallback? onReceiveProgress,
    ValueChanged<Response<dynamic>?>? onDone,
    ValueChanged<Object?>? onError,
  }) async {
    try {
      final savePath = await switch (storage) {
        StorageType.internal => StorageService.getInternalPath(),
        StorageType.external => StorageService.getExternalPath(),
      };

      if (await StorageService.isFileExists(
        fileName: fileName,
        storage: storage,
      )) {
        onDone?.call(null);
        return;
      }

      final fullFilePath = join(savePath, fileName);
      final response = await _dio.download(
        url,
        fullFilePath,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        onDone?.call(response);
      } else {
        onError?.call(
          "Download failed with status code ${response.statusCode}",
        );
      }
    } catch (e) {
      onError?.call(e);
    }
  }

  Future<void> downloadOrSave({
    required String url,
    required String fileName,
    StorageType storage = StorageType.external,
    ProgressCallback? onReceiveProgress,
    ValueChanged<Response<dynamic>>? onDone,
    ValueChanged<Object?>? onError,
  }) async {}
}
