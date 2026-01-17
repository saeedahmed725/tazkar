import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';

class PrayerSliverCard extends StatelessWidget {
  const PrayerSliverCard({super.key});

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.hour < 12 ? 'AM' : 'PM'}';
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> prayerTimes = [
      {'name': 'Fajr', 'time': DateTime(2025, 1, 1, 4, 41)},
      {'name': 'Dhuhr', 'time': DateTime(2025, 1, 1, 12, 30)},
      {'name': 'Asr', 'time': DateTime(2025, 1, 1, 15, 15)},
      {'name': 'Maghrib', 'time': DateTime(2025, 1, 1, 18, 5)},
      {'name': 'Isha', 'time': DateTime(2025, 1, 1, 19, 30)},
    ];

    return SliverToBoxAdapter(
      child: BlurBackground(
        width: MediaQuery.of(context).size.width - 32,
        height: 269,
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
          width: 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'اقْرَأْ بِاسْمِ رَبِّكَ',
                children: [
                  TextSpan(
                    text: '\nالَّذِي خَلَقَ',
                    style: const TextStyle(fontSize: 23),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                height: 1.7,
                color: Colors.white,
                fontFamily: AppFonts.neiriziQuranFonts,
                shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
              ),
            ),

            Text(
              "04:41 AM",
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.robotoFonts,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
              ),
            ),
            Text(
              'Fajr 3 hour 9 min left',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: AppFonts.neiriziQuranFonts,
                shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              height: 66,
              width: MediaQuery.of(context).size.width - 32,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(prayerTimes.length, (index) {
                  final prayer = prayerTimes[index];
                  return Expanded(
                    child: Column(
                      children: [
                        Text(
                          prayer['name'],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: AppFonts.robotoFonts,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.black26, blurRadius: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SvgPicture.asset(
                          AppImageAssets.getPrayerImage(index),
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formatTime(prayer['time']),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: AppFonts.robotoFonts,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.black26, blurRadius: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Text(
//   'Recite in the name of your Lord who created',
//   style: TextStyle(
//     fontSize: 11.sp,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     fontFamily: AppFonts.neiriziQuranFonts,
//     shadows: [
//       Shadow(
//         color: Colors.black26,
//         blurRadius: 10,
//       ),
//     ],
//   ),
// ),
// SizedBox(height: 8.h),
// Text(
//   'Next prayer in $timeLeftFormatted',
//   style: TextStyle(
//     fontSize: 15.sp,
//     fontWeight: FontWeight.bold,
//     color: Colors.white.withOpacity(0.78),
//   ),
// ),
