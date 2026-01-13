import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/download/domain/repo/download_repo.dart';
import 'package:tazkar/features/download/view/bloc/percent/percent_bloc.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadRepo repo;

  DownloadBloc(this.repo) : super(DownloadInitial()) {
    on<DownloadDatabase>((event, emit) async {
      emit(DownloadLoading());
      final result =
          await repo.downloadDatabase(onReceiveProgress: (count, total) {
        final percent = (count / total * 100).toDouble();
        BlocProvider.of<PercentBloc>(event.context).add(UpdatePercent(percent));
      });
      result.data.fold(
        (failure) => emit(DownloadFailed(failure)),
        (isDone) => emit(DownloadDone(isDone)),
      );
    });
    on<CheckDatabaseIsUnzipOrNot>((event, emit) async {
      emit(DownloadInitial());
      final result = await repo.checkDatabaseIsUnzipOrNot();
      result.data.fold(
        (failure) => emit(DownloadFailed(failure)),
        (isDone) => emit(CheckDatabaseDone(isDone)),
      );
    });
    on<CheckDatabaseZipFileIsExist>((event, emit) {
      emit(DownloadInitial());
      final isDone = repo.checkDatabaseZipFileIsExist();
      emit(CheckDatabaseExistDone(isDone));
    });
  }
}
