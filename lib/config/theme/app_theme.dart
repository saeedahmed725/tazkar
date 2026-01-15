import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:tazkar/core/constants/app_fonts.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  static ThemeData light(Color primaryColor) => ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
    fontFamily: AppFonts.kSAFonts,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.cupertino,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
        TargetPlatform.windows: GoTransitions.cupertino,
        TargetPlatform.linux: GoTransitions.cupertino,
      },
    ),
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
    tabBarTheme: TabBarThemeData(
      labelColor: Color(0xffcb9a34),
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16, fontFamily: AppFonts.kSAFonts),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.kSAFonts,
      ),
      indicator: UnderlineTabIndicator(
        insets: EdgeInsets.symmetric(horizontal: 16.0),
        borderSide: BorderSide(
          color: Color(0xffcb9a34),
          width: 2.0,
        ), // Indicator customization
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color(0xffbfac6b),
      primaryContainer: AppColors.kDMushafBackgroundColor,
    ),
  );

  static ThemeData dark(Color primaryColor) => ThemeData(
    primaryColor: AppColors.kDPrimaryColor,
    brightness: Brightness.dark,
    dividerColor: Colors.black54,
    fontFamily: AppFonts.kSAFonts,
    scaffoldBackgroundColor: AppColors.kDScaffoldBackgroundColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.cupertino,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
        TargetPlatform.windows: GoTransitions.cupertino,
        TargetPlatform.linux: GoTransitions.cupertino,
      },
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: Color(0xffcb9a34),
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16, fontFamily: AppFonts.kSAFonts),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.kSAFonts,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Color(0xffcb9a34),
          width: 2.0,
        ), // Indicator customization
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Color(0xff8b9cce),
      primaryContainer: AppColors.kDMushafBackgroundColor,
    ),
  );
}
