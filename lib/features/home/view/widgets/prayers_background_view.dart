import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../prayer_timings/data/enums/timing_props.dart';
import '../../../prayer_timings/view/bloc/prayer_bloc.dart';

class PrayersBackgroundView extends StatelessWidget {
  const PrayersBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerBloc, PrayerState>(
      buildWhen: (previous, current) =>
          previous.currentPrayer != current.currentPrayer,
      builder: (context, state) {
        final currentPrayer = state.currentPrayer ?? TimingProps.fajr;
        return AnimatedPositioned.fromRect(
          rect: currentPrayer.prayerPosition(MediaQuery.sizeOf(context)),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: currentPrayer.isDayTime
                      ? Colors.amberAccent.withValues(alpha: 0.2)
                      : Colors.blueGrey.withValues(alpha: 0.3),
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Icon(
                currentPrayer.isDayTime
                    ? Icons.wb_sunny
                    : Icons.nightlight_round,
                key: ValueKey<bool>(currentPrayer.isDayTime),
                color: currentPrayer.isDayTime ? Colors.amber : Colors.white,
                size: 60,
              ),
            ),
          ),
        );
      },
    );
  }
}
