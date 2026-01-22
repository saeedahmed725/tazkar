import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_assets.dart';

enum TimingProps {
  fajr,
  dhuhr,
  asr,
  maghrib,
  isha;

  String get icon {
    return switch (this) {
      TimingProps.fajr => AppAssets.fajirIcon,
      TimingProps.dhuhr => AppAssets.dhuhrIcon,
      TimingProps.asr => AppAssets.asserIcon,
      TimingProps.maghrib => AppAssets.maghrabIcon,
      TimingProps.isha => AppAssets.ashaaIcon,
    };
  }

  String get image {
    return switch (this) {
      TimingProps.fajr => AppAssets.maghrabImage,
      TimingProps.dhuhr => AppAssets.dhuhrImage,
      TimingProps.asr => AppAssets.asserImage,
      TimingProps.maghrib => AppAssets.maghrabImage,
      TimingProps.isha => AppAssets.maghrabImage,
    };
  }

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

  Color get color => switch (this) {
    TimingProps.fajr => const Color(0xFF1E3A8A), // Dark blue
    TimingProps.dhuhr => const Color(0xFFFBBF24), // Yellow
    TimingProps.asr => const Color(0xFF06B6D4), // Cyan
    TimingProps.maghrib => const Color(0xFF0891B2), // Darker cyan
    TimingProps.isha => const Color(0xFF1E293B), // Very dark blue/navy
  };

  Rect prayerPosition(Size screenSize) {
    const double objectRadius = 40.0;

    final Offset arcCenter = Offset(
      screenSize.width / 2,
      screenSize.height * 0.2,
    );

    final double arcWidthRadius = screenSize.width * 0.45;

    final double arcHeightRadius = screenSize.width * 0.20;

    final double angle =
        math.pi -
        (switch (this) {
              TimingProps.fajr => 0.0,
              TimingProps.dhuhr => 0.5,
              TimingProps.asr => 0.7,
              TimingProps.maghrib => 0.9,
              TimingProps.isha => 1.0,
            } *
            math.pi);

    final double x = arcCenter.dx + arcWidthRadius * math.cos(angle);
    final double y = arcCenter.dy - arcHeightRadius * math.sin(angle);

    return Rect.fromCircle(center: Offset(x, y), radius: objectRadius);
  }
}
