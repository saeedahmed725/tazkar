import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:tazkar/features/quran/data/datasource/quran_local_datasource.dart';
import 'package:tazkar/features/quran/data/datasource/quran_remote_datasource.dart';
import 'package:tazkar/features/quran/data/model/correction_model.dart';
import 'package:tazkar/features/quran/data/repo/mushaf_repo_imp.dart';

import '../../../../../core/services/dio_factory.dart';
import '../../../../../core/services/network_client.dart';
import '../../../domain/repo/mushaf_repo.dart';

part 'evaluate_recitation_event.dart';
part 'evaluate_recitation_state.dart';

class EvaluateRecitationBloc
    extends Bloc<EvaluateRecitationEvent, EvaluateRecitationState> {
  MushafRepo mushafRepo = MushafRepoImp(
    local: QuranLocalDataSource(),
    remote: QuranRemoteDatasource(client: NetworkClient(DioFactory.getDio())),
  );
  String? _recordedFilePath;
  bool isRecording = false;

  EvaluateRecitationBloc() : super(EvaluateRecitationInitial()) {
    on<EvaluateRecitationEvent>((event, emit) async {
      if (event is EvaluateRecitation) {
        emit(EvaluateRecitationLoading());
        final result = await mushafRepo.recitation(
            pageNumber: event.pageNumber, file: event.file);
        result.fold(
          (failure) => emit(EvaluateRecitationError(failure.message)),
          (verses) {
            emit(EvaluateRecitationSuccess(verses: verses));
          },
        );
      }
    });
    on<EvaluateRecitationStart>((event, emit) async {
      emit(EvaluateRecitationStarting());

      isRecording = true;
      emit(EvaluateRecitationInitial());
    });

    on<EvaluateRecitationEnd>((event, emit) async {
      emit(EvaluateRecitationEnding());

      if (_recordedFilePath == null) {
        emit(EvaluateRecitationError("No audio recorded"));
        return;
      }

      final file = File(_recordedFilePath!);

      add(EvaluateRecitation(pageNumber: event.pageNumber, file: file));
    });
  }


}
