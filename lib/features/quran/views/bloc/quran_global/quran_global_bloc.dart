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

  QuranGlobalBloc(this.repo) : super(AyahGlyphsLoading()) {
    on<GetQuranAndAyahGlyphs>((event, emit) async {
      emit(AyahGlyphsLoading());
      final result = await repo.getQuranTextAndAyahGlyphs();
      result.data.fold(
        (failure) => emit(AyahGlyphsError(failure)),
        (ayahGlyphs) => emit(QuranTextAndAyahGlyphsLoaded(
            ayahGlyphs: ayahGlyphs.ayahs, quranText: ayahGlyphs.quranText)),
      );
    });
  }
}
