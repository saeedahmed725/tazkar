import 'dart:math' as math;

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/constants/app_shared_keys.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/core/utils/components/sheets.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/core/utils/helpers/shared_pref.dart';
import 'package:tazkar/features/prayer_timings/data/enums/timing_props.dart';
import 'package:tazkar/features/prayer_timings/view/bloc/prayer_bloc.dart';

import '../widgets/prayer_settings_view.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerBloc, PrayerState>(
      builder: (context, state) {
        if (state.status == PrayerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == PrayerStatus.failure && state.failure != null) {
          return AppFailureWidget(
            failure: state.failure!,
            onRetry: () => context.read<PrayerBloc>().add(
              const PrayerRequested(shouldRefresh: true),
            ),
          );
        }

        if (state.status == PrayerStatus.success) {
          return PrayerView(state: state);
        }

        return Center(
          child: ElevatedButton(
            onPressed: () => context.read<PrayerBloc>().add(
              const PrayerRequested(shouldRefresh: true),
            ),
            child: const Text('Load Prayer Times'),
          ),
        );
      },
    );
  }
}

class PrayerView extends StatelessWidget {
  const PrayerView({super.key, required this.state});

  final PrayerState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -160,
          left: 0,
          right: 0,
          child: Image.asset(
            state.currentPrayer?.image ?? AppAssets.dhuhrImage,
            fit: BoxFit.fitWidth,
          ),
        ),
        SafeArea(
          child: NextPrayerCard(
            progress: state.progress,
            nextPrayer: state.nextPrayer?.name.tr() ?? '--',
            nextPrayerTime: state.nextPrayerTime != null
                ? DateFormat('hh:mm a').format(state.nextPrayerTime!)
                : '--',
            countdown: state.countdown ?? '--:--:--',
            currentPrayer: state.currentPrayer?.name.tr(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PrayerTimesList(
            times: state.todayTimes,
            currentPrayer: state.currentPrayer,
            nextPrayer: state.nextPrayer,
          ),
        ),
      ],
    );
  }
}

class LocationNameWidget extends StatelessWidget {
  const LocationNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final location = SharedPrefs.getString(AppSharedKeys.fallbackAddress);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => context.read<PrayerBloc>().add(
        const PrayerRequested(shouldRefresh: true),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_rounded, color: Colors.white, size: 20),
          Text(
            location.isNotEmpty ? location : 'Unknown Location',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black38,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPrayerCard extends StatelessWidget {
  const NextPrayerCard({
    super.key,
    required this.nextPrayer,
    required this.nextPrayerTime,
    required this.countdown,
    this.currentPrayer,
    this.progress = 0.65,
  });

  final String nextPrayer;
  final String nextPrayerTime;
  final String countdown;
  final String? currentPrayer;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationNameWidget(),
              IconButton(
                onPressed: () {
                  Sheets.showModel(
                    context,
                    isScrollControlled: true,
                    child: PrayerSettingsView(),
                  );
                },
                style: ButtonStyle(elevation: WidgetStateProperty.all(12)),
                icon: SvgPicture.asset(
                  AppAssets.menuLineIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  size: const Size(240, 120),
                  painter: ProgressArcPainter(progress: progress),
                ),
                Positioned(
                  bottom: 12,
                  child: ClipOval(
                    child: BlurBackground(
                      width: 48,
                      height: 48,
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.4),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      child: const Icon(
                        Icons.mosque_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          BlurBackground(
            borderRadius: BorderRadius.circular(32),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            color: Colors.white.withValues(alpha: 0.12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.25),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            child: Column(
              spacing: 14,
              children: [
                Text(
                  'Remaining time to $nextPrayer Pray',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  countdown,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: 4,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressArcPainter extends CustomPainter {
  final double progress;

  ProgressArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 4),
      math.pi,
      math.pi,
      false,
      bgPaint,
    );

    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.9),
          Colors.white.withValues(alpha: 0.6),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 4),
      math.pi,
      math.pi * progress, // الـ progress
      false,
      progressPaint,
    );

    final dotPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(center.dx - radius + 4, center.dy), 4, dotPaint);

    canvas.drawCircle(Offset(center.dx + radius - 4, center.dy), 4, dotPaint);
  }

  @override
  bool shouldRepaint(ProgressArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class PrayerTimesList extends StatelessWidget {
  const PrayerTimesList({
    super.key,
    required this.times,
    required this.currentPrayer,
    required this.nextPrayer,
  });

  final List<PrayerTimeView> times;
  final TimingProps? currentPrayer;
  final TimingProps? nextPrayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with date
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              HijriCalendar.now().toFormat("dd MMMM yyyy"),
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          // Prayer times list
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: times.length,
            separatorBuilder: (_, _) => SizedBox(height: 6),
            itemBuilder: (context, index) => PrayerTimeItem(
              time: times[index],
              isCurrent: currentPrayer == times[index].prayer,
              isNext: nextPrayer == times[index].prayer,
            ),
          ),
          kToolbarHeight.heightBox,
        ],
      ),
    );
  }
}

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({
    super.key,
    required this.time,
    required this.isCurrent,
    required this.isNext,
  });

  final PrayerTimeView time;
  final bool isCurrent;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(22),
        border: isCurrent
            ? Border.all(color: Colors.grey.shade300)
            : Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          /// CIRCULAR ICON
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: time.prayer.color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                time.prayer.icon,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),

          12.widthBox,

          /// NAME AND TIME
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time.prayer.name.tr(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                2.heightBox,
                Text(
                  DateFormat('hh:mm a').format(time.time),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          /// MUTE/BELL ICON
          Icon(
            Icons.notifications_off_outlined,
            size: 20,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
