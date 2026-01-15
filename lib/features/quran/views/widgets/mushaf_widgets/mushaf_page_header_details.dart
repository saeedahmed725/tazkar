import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/views/controller/mushaf_controller.dart';

class MushafPageHeaderDetails extends StatelessWidget {
  const MushafPageHeaderDetails({
    super.key,
    required this.glyphs,
    required this.index,
  });

  final AyahGlyph glyphs;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String juzName = MushafController.instance.getJuzName(glyphs);
    final List<String> pageSurahNames = MushafController.instance
        .getPageSurahNames(index);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ArabicResponsiveText(fontSize: 14, text: juzName),
          Spacer(),
          SvgPicture.asset(
            MushafController.instance.isLeftPage(index)
                ? AppImageAssets.icPageLeftSvg
                : AppImageAssets.icRightLeftSvg,
            colorFilter: ColorFilter.mode(
              context.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          Spacer(),
          Row(
            children: List.generate(pageSurahNames.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ArabicResponsiveText(
                  fontFamily: AppFonts.neiriziQuranFonts,
                  fontSize: 15,
                  text: pageSurahNames[index],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
