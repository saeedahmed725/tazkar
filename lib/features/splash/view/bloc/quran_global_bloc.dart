import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';
import 'package:tazkar/features/quran/domain/repo/mushaf_repo.dart';

part 'quran_global_event.dart';
part 'quran_global_state.dart';

class QuranGlobalBloc extends Bloc<QuranGlobalEvent, QuranGlobalState> {
  final MushafRepo repo;

  QuranGlobalBloc(this.repo) : super(const QuranGlobalState()) {
    on<InitDB>((event, emit) async {
      final result = await repo.findDBFile();
      result.when(
        onFailure: (failure) => emit(
          state.copyWith(status: QuranGlobalStatus.error, failure: failure),
        ),
        onSuccess: (isFound) {
          if (isFound) {
            add(GetQuranAndAyahGlyphs());
          } else {
            emit(state.copyWith(status: QuranGlobalStatus.unzipping));
            add(ExtractZip());
          }
        },
      );
    });
    on<ExtractZip>((event, emit) async {
      emit(state.copyWith(status: QuranGlobalStatus.unzipping));

      final result = await repo.extractZip(
        onProgress: (done, total) {
          final progress = ((done / total) * 100).toStringAsFixed(0);
          emit(state.copyWith(zipProgress: progress));
        },
      );
      result.when(
        onFailure: (failure) => emit(
          state.copyWith(status: QuranGlobalStatus.error, failure: failure),
        ),
        onSuccess: (_) {
          add(GetQuranAndAyahGlyphs());
        },
      );
    });

    on<GetQuranAndAyahGlyphs>((event, emit) async {
      final result = await repo.getQuranTextAndAyahGlyphs();
      result.when(
        onFailure: (failure) => emit(
          state.copyWith(status: QuranGlobalStatus.error, failure: failure),
        ),
        onSuccess: (ayahGlyphs) => emit(
          state.copyWith(
            status: QuranGlobalStatus.loaded,
            ayahGlyphs: ayahGlyphs.ayahs,
            quranText: ayahGlyphs.quranText,
          ),
        ),
      );
    });
  }
}
