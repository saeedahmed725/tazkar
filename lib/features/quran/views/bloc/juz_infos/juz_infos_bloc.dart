import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/domain/repo/mushaf_repo.dart';

part 'juz_infos_event.dart';
part 'juz_infos_state.dart';

class JuzInfosBloc extends Bloc<JuzInfosEvent, JuzInfosState> {
  final MushafRepo repo;

  JuzInfosBloc(this.repo) : super(JuzInfosLoading()) {
    on<GetJuzInfos>((event, emit) async {
      emit(JuzInfosLoading());
      final result = await repo.getJuzs();
      result.data.fold(
        (failure) {
          emit(JuzInfosError(failure: failure));
        },
        (surahInfos) {
          emit(JuzInfosLoaded(juzInfos: surahInfos));
        },
      );
    });
  }
}
