import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/database/app_database.dart';
import 'package:tazkar/core/locator/locator.dart';
import 'package:tazkar/features/prayer_tracker/data/datasource/prayer_tracker_local_datasource.dart';

import 'home_app_card.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({super.key});

  @override
  State<PrayerTracker> createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  late final PrayerTrackerLocalDatasource _datasource;

  @override
  void initState() {
    super.initState();
    _datasource = PrayerTrackerLocalDatasource(
      ServiceLocator.get<AppDatabase>(),
    );
    _datasource.getOrCreateToday();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PrayerTrackerEntry?>(
      stream: _datasource.watchToday(),
      builder: (context, snapshot) {
        final entry = snapshot.data;
        if (entry == null) {
          return HomeAppCard(
            title: 'prayer_tracker'.tr(),
            icon: AppAssets.ayaOfDayImage,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final prayers = [
          ('fajr'.tr(), entry.fajr, PrayerType.fajr),
          ('dhuhr'.tr(), entry.dhuhr, PrayerType.dhuhr),
          ('asr'.tr(), entry.asr, PrayerType.asr),
          ('maghrib'.tr(), entry.maghrib, PrayerType.maghrib),
          ('isha'.tr(), entry.isha, PrayerType.isha),
        ];

        return HomeAppCard(
          title: 'prayer_tracker'.tr(),
          icon: AppAssets.ayaOfDayImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: prayers.asMap().entries.map((entryItem) {
              final index = entryItem.key;
              final prayer = entryItem.value;
              final name = prayer.$1;
              final isDone = prayer.$2;
              final type = prayer.$3;

              return InkWell(
                onTap: () =>
                    _datasource.setPrayerStatus(prayer: type, value: !isDone),
                borderRadius: BorderRadius.circular(999),
                child: TweenAnimationBuilder<double>(
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
                          color: isDone
                              ? null
                              : Colors.white.withValues(alpha: 0.05),
                          border: Border.all(
                            color: isDone
                                ? context.secondary.withValues(alpha: 0.5)
                                : Colors.white.withValues(alpha: 0.2),
                            width: 2,
                          ),
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
                          fontWeight: isDone
                              ? FontWeight.w600
                              : FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
