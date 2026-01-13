import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/quran/surah_names.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';

class JuzCardView extends StatelessWidget {
  const JuzCardView(
      {super.key,
      required this.juzInfos,
      required this.quran,
      required this.index});

  final List<JuzModel> juzInfos;
  final List<QuranModel> quran;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.toNamed(
        AppRoutes.quran,
        arguments: {"pageNumber": juzInfos[index].pageNo},
      ),
      splashColor: AppColor.kPrimaryColor.withOpacity(0.1),
      hoverColor: AppColor.kPrimaryColor.withOpacity(0.1),
      highlightColor: AppColor.kPrimaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  juzInfos[index].juzName,
                  style: TextStyle(
                    fontFamily: AppFonts.surahNamesFonts,
                    fontSize: 20,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImageAssets.borderNoIcon,
                      height: 40,
                      colorFilter: ColorFilter.mode(
                          AppColor.kPrimaryColor, BlendMode.srcIn),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColor.kPrimaryColor,
                      child: Text(
                        AppFunctions.toArabicNumbers(
                            juzInfos[index].juzNum.toString()),
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
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                      TextSpan(
                        text: surahNames[
                            quran[juzInfos[index].ayaNo - 1].soraNum - 1],
                        children: [
                          TextSpan(
                            text: AppFunctions.toArabicNumbers(
                                ' - ${quran[juzInfos[index].ayaNo - 1].ayaNum}'),
                            style: TextStyle(
                              fontFamily: AppFonts.arabicNumbers,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: AppFonts.surahNamesFonts,
                      )),
                  5.heightGap,
                  Text(quran[juzInfos[index].ayaNo - 1].ayaDiac,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: AppFonts.hafsQuranFonts,
                      )),
                  Divider(color: AppColor.kPrimaryColor.withOpacity(0.3)),
                  Text.rich(
                      TextSpan(
                        text: surahNames[
                            quran[juzInfos[index].endAya - 1].soraNum - 1],
                        children: [
                          TextSpan(
                            text: AppFunctions.toArabicNumbers(
                                ' - ${quran[juzInfos[index].endAya - 1].ayaNum}'),
                            style: TextStyle(
                              fontFamily: AppFonts.arabicNumbers,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: AppFonts.surahNamesFonts,
                      )),
                  5.heightGap,
                  Text(quran[juzInfos[index].endAya - 1].ayaDiac,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: AppFonts.hafsQuranFonts,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
