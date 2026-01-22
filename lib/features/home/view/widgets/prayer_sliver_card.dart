import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';

import '../../../prayer_timings/view/bloc/prayer_bloc.dart';

class PrayerSliverCard extends StatelessWidget {
  const PrayerSliverCard({super.key});

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.hour < 12 ? 'AM' : 'PM'}';
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlurBackground(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: MediaQuery.of(context).size.width - 32,
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colorScheme.secondary.withValues(alpha: 0.5),
          width: 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.getMonth(HijriCalendar.now().hMonth)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: BlocBuilder<PrayerBloc, PrayerState>(
                buildWhen: (previous, current) =>
                    previous.nextPrayer != current.nextPrayer ||
                    previous.countdown != current.countdown,
                builder: (context, state) {
                  final nextPrayer = state.nextPrayer?.name.tr() ?? '--';

                  return Text(
                    'next_prayer_time'.tr(
                      namedArgs: {
                        'time': state.countdown ?? '--:--:--',
                        'prayer_name': nextPrayer,
                      },
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.robotoFonts,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            BlocBuilder<PrayerBloc, PrayerState>(
              buildWhen: (previous, current) =>
                  !listEquals(previous.todayTimes, current.todayTimes),
              builder: (context, state) {
                return Row(
                  children: List.generate(state.todayTimes.length, (index) {
                    final prayer = state.todayTimes[index];
                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            prayer.prayer.name.tr(),
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
                            AppAssets.getPrayerImage(index),
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            formatTime(prayer.time),
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
                );
              },
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
