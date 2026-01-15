import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/functions/functions.dart';

import '../../../../../../core/constants/app_colors.dart';

class SurahCardView extends StatelessWidget {
  const SurahCardView({
    super.key,
    required this.arName,
    required this.enName,
    required this.ayahLength,
    required this.surahId,
    required this.onTap,
    required this.surahType,
  });

  final String arName;

  final String enName;

  final String ayahLength;

  final int surahId;

  final int surahType;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      splashColor: context.primaryColor.withValues(alpha: 0.1),
      hoverColor: context.primaryColor.withValues(alpha: 0.1),
      trailing: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(enName),
                Row(
                  children: [
                    Text(surahType == 1 ? "Mecca" : "Madinan"),
                    5.widthBox,
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.kSecondaryColor,
                    ),
                    5.widthBox,
                    Text("$ayahLength verses"),
                  ],
                ),
              ],
            ),
            10.widthBox,
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppImageAssets.borderNoIcon,
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    context.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: context.primaryColor,
                  child: Text(
                    AppFunctions.toArabicNumbers(surahId.toString()),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.arabicNumbers,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      title: Text(
        arName,
        style: TextStyle(fontFamily: AppFonts.surahNamesFonts, fontSize: 20),
      ),
      onTap: onTap,
    );
  }
}
