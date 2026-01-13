import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/core/utils/functions/functions.dart';

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
      splashColor: AppColor.kPrimaryColor.withOpacity(0.1),
      hoverColor: AppColor.kPrimaryColor.withOpacity(0.1),
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
                    5.widthGap,
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColor.kSecondaryColor,
                    ),
                    5.widthGap,
                    Text("$ayahLength verses"),
                  ],
                )
              ],
            ),
            10.widthGap,
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppImageAssets.borderNoIcon,
                  height: 40,
                  colorFilter:
                      ColorFilter.mode(AppColor.kPrimaryColor, BlendMode.srcIn),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColor.kPrimaryColor,
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
        style: TextStyle(
          fontFamily: AppFonts.surahNamesFonts,
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }
}
