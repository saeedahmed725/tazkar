import 'package:flutter/material.dart';

class AppLanguage {
  AppLanguage._();
  static const String arabic = 'ar';
  static const String english = 'en';
  static const String localizationPath = 'assets/translations';
  static const Locale arabicLocal = Locale(arabic);
  static const Locale englishLocal = Locale(english);

  static List<Locale> get locals => [arabicLocal, englishLocal];
}
