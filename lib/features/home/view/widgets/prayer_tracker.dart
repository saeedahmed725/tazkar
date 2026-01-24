import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_app_card.dart';

class PrayerTracker extends StatelessWidget {
  const PrayerTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final prayers = [
      ('Fajr', true),
      ('Dzuhr', true),
      ('Asr', false),
      ('Maghrib', false),
      ('Isha', false),
    ];

    return HomeAppCard(
      title: 'prayer_tracker'.tr(),
      icon: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: prayers.map((prayer) {
          final name = prayer.$1;
          final isDone = prayer.$2;

          return Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone ? Colors.green : Colors.transparent,
                  border: Border.all(
                    color: isDone ? Colors.green : Colors.grey.shade100,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 18,
                  color: isDone ? Colors.white : Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
