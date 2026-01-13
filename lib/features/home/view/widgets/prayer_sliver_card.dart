import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';

class PrayerSliverCard extends StatelessWidget {
  const PrayerSliverCard({super.key});

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;
    String hoursStr = hours > 0 ? "$hours hours " : "";
    String minutesStr = minutes > 0 ? "$minutes minutes " : "";
    return "$hoursStr$minutesStr".trim();
  }

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.hour < 12 ? 'AM' : 'PM'}';
  }

  String timeLeft(DateTime time) {
    final now = DateTime.now();
    final difference = time.difference(now);

    if (difference.isNegative) return 'Passed';

    return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ${difference.inMinutes % 60} min left';
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

    DateTime currentTime = DateTime.now().toUtc().add(Duration(hours: 2));
    DateTime nextPrayerTime =
        DateTime.now().add(Duration(hours: 3, minutes: 9));
    String formattedTime = intl.DateFormat('hh:MM').format(DateTime.now());
    String formattedTimeA = intl.DateFormat('a').format(DateTime.now());

    // Duration timeLeft = nextPrayerTime.difference(currentTime);
    // String timeLeftFormatted = _formatDuration(timeLeft);
    return SliverToBoxAdapter(
      child: BlurBackground(
        width: 1.sw - 32.w,
        height: 269.h,
        color: AppColor.kOffWhiteColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
            color: AppColor.kSecondaryColor.withOpacity(0.5), width: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(text: 'اقْرَأْ بِاسْمِ رَبِّكَ', children: [
                TextSpan(
                  text: '\nالَّذِي خَلَقَ',
                  style: TextStyle(
                    fontSize: 23.sp,
                  ),
                ),
              ]),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                height: 1.7,
                color: Colors.white,
                fontFamily: AppFonts.neiriziQuranFonts,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),

            Text(
              "04:41 AM",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.robotoFonts,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            Text(
              'Fajr 3 hour 9 min left',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: AppFonts.neiriziQuranFonts,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            Container(
              height: 66.h,
              width: 1.sw - 32.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: List.generate(
                  prayerTimes.length,
                  (index) {
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
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          SvgPicture.asset(
                            AppImageAssets.getPrayerImage(index),
                            width: 28.sp,
                            height: 28.sp,
                            colorFilter:
                                ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            formatTime(prayer['time']),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontFamily: AppFonts.robotoFonts,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
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
