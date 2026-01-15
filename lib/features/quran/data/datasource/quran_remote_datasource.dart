import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tazkar/core/network/network_client.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/model/correction_model.dart';

class QuranRemoteDatasource {
  final NetworkClient client;

  QuranRemoteDatasource({required this.client});

  Future<List<CorrectionModel>> uploadAudioFile(
      {required File file, required int pageNum}) async {
    final formData = FormData.fromMap({
      'verse': pageNum,
      'audio': await MultipartFile.fromFile(file.path,
          filename: file.uri.pathSegments.last),
    });

    Response response = await client.post(
      'http://192.168.1.17:8000/recitation',
      data: formData,
      options: Options(contentType: Headers.multipartFormDataContentType),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw NetworkFailure(
          'Failed to upload audio file: ${response.statusMessage}');
    }

    return (response.data as List)
        .map((e) => CorrectionModel.fromJson(e))
        .toList();
  }
}
