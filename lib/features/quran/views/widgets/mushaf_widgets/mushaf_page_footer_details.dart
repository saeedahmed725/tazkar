import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/core/utils/functions/functions.dart';

class MushafPageFooterDetails extends StatelessWidget {
  const MushafPageFooterDetails({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ArabicResponsiveText(
          fontSize: 14,
          fontFamily: AppFonts.arabicNumbers,
          text: AppFunctions.toArabicNumbers((pageIndex + 1).toString()),
        ),
        SvgPicture.asset(
          context.isDark
              ? AppAssets.pageFrameBoxBlueSvg
              : AppAssets.pageFrameBoxGreenSvg,
          height: 17,
        ),
      ],
    );
  }
}
