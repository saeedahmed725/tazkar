import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/appbar_wiegets/last_reading_surah_card.dart';

class FlexibleSpaceBackground extends StatelessWidget {
  const FlexibleSpaceBackground({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor,
        image: DecorationImage(
            image: AssetImage(AppImageAssets.lastReadingBackground),
            fit: BoxFit.cover),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImageAssets.starsIconsBackground,
            opacity: const AlwaysStoppedAnimation<double>(0.2),
            fit: BoxFit.cover,
          ),
          LastReadingSurahCard(scrollController: scrollController),
        ],
      ),
    );
  }
}
