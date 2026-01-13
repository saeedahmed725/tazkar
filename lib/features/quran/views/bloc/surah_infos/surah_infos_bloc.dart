import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';
import 'package:tazkar/features/quran/domain/repo/mushaf_repo.dart';

part 'surah_infos_event.dart';
part 'surah_infos_state.dart';

class SurahInfosBloc extends Bloc<SurahInfosEvent, SurahInfosState> {
  final MushafRepo repo;

  SurahInfosBloc(this.repo) : super(SurahInfosLoading()) {
    on<GetSurahInfos>((event, emit) async {
      emit(SurahInfosLoading());
      final result = await repo.getSurahs();
      result.data.fold(
        (failure) {
          emit(SurahInfosError(failure: failure));
        },
        (surahInfos) {
          emit(SurahInfosLoaded(surahInfos: surahInfos));
        },
      );
    });
  }
}
