import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        dividerColor: Colors.white54,
        fontFamily: AppFonts.kSAFonts,
        scaffoldBackgroundColor: AppColor.kScaffoldBackgroundColor,
        tabBarTheme: TabBarThemeData(
          labelColor: Color(0xffcb9a34),
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: AppFonts.kSAFonts,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontFamily: AppFonts.kSAFonts,
          ),
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 16.0),
            borderSide: BorderSide(
                color: Color(0xffcb9a34),
                width: 2.0), // Indicator customization
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: const Color(0xffbfac6b),
          primaryContainer: AppColor.kDMushafBackgroundColor,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
      primaryColor: AppColor.kDPrimaryColor,
      brightness: Brightness.dark,
      dividerColor: Colors.black54,
      fontFamily: AppFonts.kSAFonts,
      scaffoldBackgroundColor: AppColor.kDScaffoldBackgroundColor,
      tabBarTheme: TabBarThemeData(
        labelColor: Color(0xffcb9a34),
        unselectedLabelColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.kSAFonts,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.kSAFonts,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
              color: Color(0xffcb9a34), width: 2.0), // Indicator customization
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: Color(0xff8b9cce),
        primaryContainer: AppColor.kDMushafBackgroundColor,
      ));
}
