import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/locator/locator.dart';

import '../../../../core/quran/global_quran_data.dart';
import 'home_app_card.dart';

class AyaDayCard extends StatelessWidget {
  const AyaDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeAppCard(
      title: 'ayah_of_the_day'.tr(),
      icon: AppAssets.icAyahNoSvg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ServiceLocator.get<GlobalQuranData>().quranText.first.ayaDiac,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontFamily: AppFonts.hafsQuranFonts,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${ServiceLocator.get<GlobalQuranData>().quranText.first.soraName} : الاية${ServiceLocator.get<GlobalQuranData>().quranText.first.ayaNum}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
