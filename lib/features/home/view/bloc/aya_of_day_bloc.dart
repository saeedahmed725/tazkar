import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tazkar/core/constants/app_shared_keys.dart';
import 'package:tazkar/core/quran/quran.dart';
import 'package:tazkar/core/utils/helpers/shared_pref.dart';
import 'package:tazkar/features/home/domain/entity/aya_of_day_entity.dart';

part 'aya_of_day_event.dart';
part 'aya_of_day_state.dart';

class AyaOfDayBloc extends Bloc<AyaOfDayEvent, AyaOfDayState> {
  AyaOfDayBloc() : super(AyaOfDayState.initial()) {
    on<AyaOfDayRequested>(_onRequested);
    on<AyaOfDayRefreshed>(_onRefreshed);
  }

  Future<void> _onRequested(
    AyaOfDayRequested event,
    Emitter<AyaOfDayState> emit,
  ) async {
    emit(state.copyWith(status: AyaOfDayStatus.loading, message: null));

    final savedAyaJson = SharedPrefs.getString(AppSharedKeys.ayahOfDay);
    if (savedAyaJson.isNotEmpty) {
      try {
        final savedAyaMap = jsonDecode(savedAyaJson) as Map<String, dynamic>;
        final savedAya = AyaOfDayEntity.fromJson(savedAyaMap);

        final now = DateTime.now();
        final savedDate = DateTime.tryParse(savedAya.date);

        if (savedDate == null || !_isSameDay(now, savedDate)) {
          _fetchNewAyaOfDay(emit);
        } else {
          emit(state.copyWith(status: AyaOfDayStatus.success, aya: savedAya));
        }
      } catch (_) {
        _fetchNewAyaOfDay(emit);
      }
    } else {
      _fetchNewAyaOfDay(emit);
    }
  }

  Future<void> _onRefreshed(
    AyaOfDayRefreshed event,
    Emitter<AyaOfDayState> emit,
  ) async {
    emit(state.copyWith(status: AyaOfDayStatus.loading, message: null));
    _fetchNewAyaOfDay(emit);
  }

  void _fetchNewAyaOfDay(Emitter<AyaOfDayState> emit) {
    final quranText = Quran.instance.quranText;

    if (quranText.isEmpty) {
      emit(
        state.copyWith(
          status: AyaOfDayStatus.failure,
          message: 'Quran data is empty',
        ),
      );
      return;
    }

    final randomAya = Random().nextInt(quranText.length);
    final ayah = quranText[randomAya];

    final ayaOfDayEntity = AyaOfDayEntity(
      ayahNo: ayah.ayaNum.toString(),
      surahNo: ayah.soraNum.toString(),
      ref: '${ayah.soraName} - الآية ${ayah.ayaNum}',
      subTitle: ayah.ayaDiac,
    );

    _saveAyaOfDay(ayaOfDayEntity);
    emit(state.copyWith(status: AyaOfDayStatus.success, aya: ayaOfDayEntity));
  }

  Future<void> _saveAyaOfDay(AyaOfDayEntity ayaOfDayEntity) async {
    await SharedPrefs.setString(
      AppSharedKeys.ayahOfDay,
      jsonEncode(ayaOfDayEntity.toJson()),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
