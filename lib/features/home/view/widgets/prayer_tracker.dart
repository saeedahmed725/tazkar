import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_assets.dart';

import 'home_app_card.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({super.key});

  @override
  State<PrayerTracker> createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  final prayers = [
    ('fajr'.tr(), true),
    ('dhuhr'.tr(), true),
    ('asr'.tr(), false),
    ('maghrib'.tr(), false),
    ('isha'.tr(), false),
  ];

  @override
  Widget build(BuildContext context) {
    final completedCount = prayers.where((p) => p.$2).length;
    final totalCount = prayers.length;

    return HomeAppCard(
      title: 'prayer_tracker'.tr(),
      icon: AppAssets.ayaOfDayImage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: prayers.asMap().entries.map((entry) {
          final index = entry.key;
          final prayer = entry.value;
          final name = prayer.$1;
          final isDone = prayer.$2;

          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 300 + (index * 100)),
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: isDone
                        ? LinearGradient(
                            colors: [
                              Colors.green.shade400,
                              Colors.green.shade600,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: isDone ? null : Colors.white.withValues(alpha: 0.05),
                    border: Border.all(
                      color: isDone
                          ? Colors.green.shade300.withValues(alpha: 0.5)
                          : Colors.white.withValues(alpha: 0.2),
                      width: 2,
                    ),
                    boxShadow: isDone
                        ? [
                            BoxShadow(
                              color: Colors.green.withValues(alpha: 0.3),
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isDone
                        ? Icon(
                            Icons.check_rounded,
                            key: const ValueKey('check'),
                            size: 28,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.circle_outlined,
                            key: const ValueKey('empty'),
                            size: 24,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDone ? Colors.white : Colors.white70,
                    fontWeight: isDone ? FontWeight.w600 : FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
