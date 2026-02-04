import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/home/view/bloc/aya_of_day_bloc.dart';

import 'home_app_card.dart';

class AyaDayCard extends StatelessWidget {
  const AyaDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeAppCard(
      title: 'ayah_of_the_day'.tr(),
      icon: AppAssets.ayaOfDayImage,
      child: BlocBuilder<AyaOfDayBloc, AyaOfDayState>(
        builder: (context, state) {
          final aya = state.aya;
          final text = aya?.subTitle ?? '--';
          final ref = aya?.ref ?? '--';

          return Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontFamily: AppFonts.hafsQuranFonts,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              Text(
                ref.toArabicNumbers,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontFamily: AppFonts.arabicNumbers,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
