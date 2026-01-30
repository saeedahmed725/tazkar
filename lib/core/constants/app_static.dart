// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';

class AppStatic {
  static String appFolder = "tazakar";

  static List<String> listOfIcons = [];
  static const int GLYPH_TYPE_WORD = 1;
  static const int GLYPH_TYPE_AYAH_NUMBER = 2;
  static const int GLYPH_TYPE_MARKS = 3; // (مثل علامات الوقف)
  static const int GLYPH_TYPE_RUBA = 4;
  static const int GLYPH_TYPE_SAJDAH = 5;
  static const int GLYPH_TYPE_SURAH = 6; // ex: (الفاتحة، الناس)
  // static const int GLYPH_TYPE_SURAH_WORD = 7; // (word_سورة)
  static const int GLYPH_TYPE_BISM_ALLAH = 8;



  //// ========================= General ==================================
  static String get kSetting => 'settings'.tr();
  static String get kGeneral => 'general'.tr();
  static String get kAppearance => 'appearance'.tr();
  static String get kAccentColor => 'accent_color'.tr();
  static String get kChooseTheme => 'choose_theme'.tr();
  static String get kChooseAccentColor => 'choose_accent_color'.tr();

  //// ========================= Language =================================
  static String get kLanguage => 'language'.tr();
  static String get kEnglish => 'english'.tr();
  static String get kArabic => 'arabic'.tr();
  static String get kChangeLanguage => 'change_language'.tr();


  //// ========================= Security & About ==========================
  static String get kAboutSecurity => 'about_security'.tr();
  static String get kLoggedInSessions => 'logged_in_sessions'.tr();
  static String get kPrivacyPolicy => 'privacy_policy'.tr();
  static String get kAboutApp => 'about_app'.tr();
  static String get kEditProfile => 'edit_profile'.tr();

}

extension LocalizationX on String {
  String get tran {
    return this.tr();
  }
}