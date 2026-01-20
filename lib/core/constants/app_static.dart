// ignore_for_file: constant_identifier_names

import 'dart:math' as math;
import 'package:flutter/material.dart';

enum TimingProps {
  fajr,
  dhuhr,
  asr,
  maghrib,
  isha;


  bool get isDayTime {
    switch (this) {
      case TimingProps.fajr:
      case TimingProps.isha:
      case TimingProps.maghrib:
        return false;
      case TimingProps.dhuhr:
      case TimingProps.asr:
        return true;
    }
  }

  double get _progress {
    switch (this) {
      case TimingProps.fajr:
        return 0.0;
      case TimingProps.dhuhr:
        return 0.5;
      case TimingProps.asr:
        return 0.7;
      case TimingProps.maghrib:
        return 0.9;
      case TimingProps.isha:
        return 1.0;
    }
  }



  Rect prayerPosition(Size screenSize) {
    const double objectRadius = 40.0;

    final Offset arcCenter = Offset(screenSize.width / 2, screenSize.height * 0.15);

    final double arcWidthRadius = screenSize.width * 0.45;

    final double arcHeightRadius = screenSize.width * 0.20;

    final double angle = math.pi - (_progress * math.pi);

    final double x = arcCenter.dx + arcWidthRadius * math.cos(angle);
    final double y = arcCenter.dy - arcHeightRadius * math.sin(angle);

    return Rect.fromCircle(
      center: Offset(x, y),
      radius: objectRadius,
    );
  }}

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
}
