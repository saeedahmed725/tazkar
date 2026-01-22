import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/features/prayer_timings/data/enums/timing_props.dart';
import 'package:tazkar/features/prayer_timings/view/bloc/prayer_bloc.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        title: Text('prayer'.tr()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.theme.colorScheme.surface,
      ),
      body: BlocBuilder<PrayerBloc, PrayerState>(
        builder: (context, state) {
          if (state.status == PrayerStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == PrayerStatus.failure) {
            return _ErrorView(
              message: state.message ?? 'Failed to load prayer times',
              onRetry: () =>
                  context.read<PrayerBloc>().add(const PrayerRequested()),
            );
          }

          if (state.status == PrayerStatus.success) {
            return _ContentView(state: state);
          }

          return Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.read<PrayerBloc>().add(const PrayerRequested()),
              child: const Text('Load Prayer Times'),
            ),
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.errorContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: 48,
              color: context.theme.colorScheme.error,
            ),
          ),
          24.heightBox,
          Text(
            message,
            style: context.titleMedium,
            textAlign: TextAlign.center,
          ),
          24.heightBox,
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({required this.state});

  final PrayerState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _NextPrayerCard(
              nextPrayer: state.nextPrayer?.name.tr() ?? '--',
              nextPrayerTime: state.nextPrayerTime != null
                  ? DateFormat('hh:mm a').format(state.nextPrayerTime!)
                  : '--',
              countdown: state.countdown ?? '--:--:--',
              currentPrayer: state.currentPrayer?.name.tr(),
            ),
            32.heightBox,
            _PrayerTimesList(
              times: state.todayTimes,
              currentPrayer: state.currentPrayer,
              nextPrayer: state.nextPrayer,
            ),
          ],
        ),
      ),
    );
  }
}

class _NextPrayerCard extends StatelessWidget {
  const _NextPrayerCard({
    required this.nextPrayer,
    required this.nextPrayerTime,
    required this.countdown,
    this.currentPrayer,
  });

  final String nextPrayer;
  final String nextPrayerTime;
  final String countdown;
  final String? currentPrayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 24,
                color: context.theme.colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
              12.widthBox,
              Flexible(
                child: Text(
                  'next_prayer_time'.tr(
                    namedArgs: {
                      'time': nextPrayerTime,
                      'prayer_name': nextPrayer,
                    },
                  ),
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          24.heightBox,
          Text(
            countdown,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.onPrimary,
              letterSpacing: 4,
              height: 1.2,
            ),
          ),
          if (currentPrayer != null) ...[
            20.heightBox,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.onPrimary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.theme.colorScheme.onPrimary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.onPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  12.widthBox,
                  Text(
                    'Current: $currentPrayer',
                    style: context.titleSmall?.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PrayerTimesList extends StatelessWidget {
  const _PrayerTimesList({
    required this.times,
    required this.currentPrayer,
    required this.nextPrayer,
  });

  final List<PrayerTimeView> times;
  final TimingProps? currentPrayer;
  final TimingProps? nextPrayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            'Prayer Times',
            style: context.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.onSurface,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: context.theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: times.length,
            separatorBuilder: (_, _) => 8.heightBox,
            itemBuilder: (context, index) => _PrayerTimeItem(
              time: times[index],
              isCurrent: currentPrayer == times[index].prayer,
              isNext: nextPrayer == times[index].prayer,
            ),
          ),
        ),
      ],
    );
  }
}

class _PrayerTimeItem extends StatelessWidget {
  const _PrayerTimeItem({
    required this.time,
    required this.isCurrent,
    required this.isNext,
  });

  final PrayerTimeView time;
  final bool isCurrent;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final isPrimary = isCurrent || isNext;
    final bgColor = isCurrent
        ? context.theme.colorScheme.primary
        : context.theme.colorScheme.surfaceContainerHighest;

    final textColor = isCurrent
        ? context.theme.colorScheme.onPrimary
        : context.theme.colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
        border: isNext && !isCurrent
            ? Border.all(
          color: context.theme.colorScheme.primary,
          width: 2,
        )
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isCurrent
                  ? context.theme.colorScheme.onPrimary.withValues(alpha: 0.2)
                  : context.theme.colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              _iconFor(time.prayer),
              size: 28,
              color: isCurrent
                  ? context.theme.colorScheme.onPrimary
                  : context.theme.colorScheme.primary,
            ),
          ),
          16.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time.prayer.name.tr(),
                  style: context.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                if (isPrimary) ...[
                  4.heightBox,
                  Text(
                    isCurrent ? 'Current prayer time' : 'Up next',
                    style: context.bodySmall?.copyWith(
                      color: textColor.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('hh:mm').format(time.time),
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              2.heightBox,
              Text(
                DateFormat('a').format(time.time),
                style: context.bodySmall?.copyWith(
                  color: textColor.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _iconFor(TimingProps prayer) {
    switch (prayer) {
      case TimingProps.fajr:
        return Icons.wb_twilight_rounded;
      case TimingProps.dhuhr:
        return Icons.wb_sunny_rounded;
      case TimingProps.asr:
        return Icons.light_mode_rounded;
      case TimingProps.maghrib:
        return Icons.nights_stay_rounded;
      case TimingProps.isha:
        return Icons.dark_mode_rounded;
    }
  }
}