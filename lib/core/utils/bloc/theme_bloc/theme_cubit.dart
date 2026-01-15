import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_shared_keys.dart';
import '../../helpers/shared_pref.dart';
import 'theme_extension.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(ThemeState(mode: _cachedTheme, accentColor: _cachedAccentColor));

  static ThemeMode get _cachedTheme =>
      ThemeExtensionX.fromName(SharedPrefs.getString(AppSharedKeys.themeKey));

  static AccentColorEntity get _cachedAccentColor {
    final hex = SharedPrefs.getString(AppSharedKeys.accentColorKey);
    final title = SharedPrefs.getString(AppSharedKeys.accentColorNameKey);
    return AccentColorEntity(
      title: title.isNotEmpty ? title : 'charcoal_blue',
      color: hex.isNotEmpty ? Color(int.parse(hex)) : AppColors.primary,
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    await SharedPrefs.setString(AppSharedKeys.themeKey, mode.name);
    emit(state.copyWith(mode: mode));
  }

  Future<void> setAccentColor(AccentColorEntity color) async {
    Future.wait([
      SharedPrefs.setString(
        AppSharedKeys.accentColorKey,
        color.color.toARGB32().toString(),
      ),
      SharedPrefs.setString(AppSharedKeys.accentColorNameKey, color.title),
    ]);

    emit(state.copyWith(accentColor: color));
  }
}
