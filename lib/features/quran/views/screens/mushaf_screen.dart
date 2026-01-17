import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/classes/colorful_safe_area.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/constants/app_static.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/views/controller/mushaf_controller.dart';
import 'package:tazkar/features/quran/views/widgets/mushaf_widgets/mushaf_page_footer_details.dart';
import 'package:tazkar/features/quran/views/widgets/mushaf_widgets/mushaf_page_header_details.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/locator/locator.dart';
import '../../../../core/quran/global_quran_data.dart';

class MushafScreen extends StatefulWidget {
  const MushafScreen({super.key, required this.pageNumber});

  final int pageNumber;

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 300),
      () => setState(() => isVisible = true),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MushafController.instance.goToPage(widget.pageNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: context.primaryColor,
        child: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          splashColor: context.primaryColor.withValues(alpha: 0.06),
          highlightColor: context.primaryColor.withValues(alpha: 0.06),
          child: Stack(
            children: [
              MushafBuilder(),
              OverlayWidgets(isVisible: isVisible),
            ],
          ),
        ),
      ),
    );
  }
}

class OverlayWidgets extends StatefulWidget {
  const OverlayWidgets({super.key, required this.isVisible});

  final bool isVisible;

  @override
  State<OverlayWidgets> createState() => _OverlayWidgetsState();
}

class _OverlayWidgetsState extends State<OverlayWidgets> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: widget.isVisible ? 10 : -100,
          left: 0,
          right: 0,
          child: MushafOverlayCard(
            child: Row(
              children: [
                SvgPicture.asset(
                  AppImageAssets.searchIcon,
                  height: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                Spacer(),
                SvgPicture.asset(
                  AppImageAssets.menuLineIcon,
                  height: 15,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          bottom: widget.isVisible ? 10 : -100,
          left: 0,
          right: 0,
          child: MushafOverlayCard(),
        ),
      ],
    );
  }
}

class MushafOverlayCard extends StatelessWidget {
  const MushafOverlayCard({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class MushafBuilder extends StatelessWidget {
  const MushafBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 604,
      controller: MushafController.instance.pageController,
      itemBuilder: (context, index) {
        return MushafPainter(
          glyphs: ServiceLocator.get<GlobalQuranData>().getAyahGlyphsForPage(
            index,
          ),
          index: index,
        );
      },
    );
  }
}

class MushafPainter extends StatelessWidget {
  final List<AyahGlyph> glyphs;
  final int index;

  const MushafPainter({super.key, required this.glyphs, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(context),
      margin: _getMargin(context),
      child: Column(
        children: [
          12.heightBox,
          MushafPageHeaderDetails(glyphs: glyphs[15], index: index),
          Spacer(),
          ..._buildAyahGlyphWithEndsRows(context),
          Spacer(),
          MushafPageFooterDetails(pageIndex: index),
          12.heightBox,
        ],
      ),
    );
  }

  List<Widget> _buildAyahGlyphWithEndsRows(BuildContext context) {
    final myGroup = AutoSizeGroup();
    int rowCount = (index == 0 || index == 1) ? 8 : 15;

    return List.generate(rowCount, (rowNumber) {
      List<AyahGlyph> ayahs = glyphs
          .where((glyph) => glyph.lineNumber == rowNumber + 1)
          .toList();
      List<bool> selectedVerses = List.generate(ayahs.length, (index) => false);
      for (var ayah in ayahs) {
        if (ayah.glyphTypeId == AppStatic.GLYPH_TYPE_BISM_ALLAH) {
          return BasmalaWidget(ayahs: ayah);
        } else if (ayah.glyphTypeId == AppStatic.GLYPH_TYPE_SURAH) {
          return SurahBannerPlace(ayah: ayah);
        }
      }
      return FittedBox(
        child: Row(
          children: List.generate(ayahs.length, (wordIndex) {
            if (ayahs[wordIndex].glyphTypeId ==
                AppStatic.GLYPH_TYPE_AYAH_NUMBER) {
              return Padding(
                padding: EdgeInsets.only(left: 2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppImageAssets.icAyahNoSvg, height: 27),
                    Text(
                      AppFunctions.toArabicNumbers(
                        ayahs[wordIndex].ayahNumber.toString(),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppFonts.arabicNumbers,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }
            return AutoSizeText.rich(
              TextSpan(
                text: ayahs[wordIndex].code,
                recognizer:
                    LongPressGestureRecognizer(
                        duration: const Duration(milliseconds: 500),
                      )
                      ..onLongPressStart = (details) {
                        selectedVerses[wordIndex] = true;
                        log('Long Pressed ${ayahs[wordIndex].wordId}');
                      },
              ),
              softWrap: true,
              textAlign: TextAlign.justify,
              group: myGroup,
              minFontSize: 16,
              stepGranularity: 2,
              maxFontSize: 25,
              presetFontSizes: [22, 21, 20, 19, 18, 17, 16],
              style: TextStyle(
                height: 2,
                fontFamily: 'P${index + 1}',
                wordSpacing: 0,
                backgroundColor: selectedVerses[0]
                    ? context.primaryColor.withValues(alpha: 0.3)
                    : Colors.transparent,
              ),
            );
          }),
        ),
      );
    });
  }

  EdgeInsets _getPadding(BuildContext context) {
    double horizontalPadding = (index == 0 || index == 1) ? 0.08 : 0.015;
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * horizontalPadding,
    );
  }

  EdgeInsets _getMargin(BuildContext context) {
    if (index == 0 || index == 1) {
      return EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.3,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.015,
    );
  }
}

class SurahBannerPlace extends StatelessWidget {
  final AyahGlyph ayah;

  const SurahBannerPlace({super.key, required this.ayah});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .82;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImageAssets.surahHeader1Svg, width: width),
          SvgPicture.asset(
            AppImageAssets.getSurahImage(ayah.surahNumber),
            height: 25,
            colorFilter: ColorFilter.mode(
              context.theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class BasmalaWidget extends StatelessWidget {
  final AyahGlyph ayahs;

  const BasmalaWidget({super.key, required this.ayahs});

  @override
  Widget build(BuildContext context) {
    if (ayahs.surahNumber == 9 || ayahs.surahNumber == 1) {
      return const SizedBox.shrink();
    }

    if (ayahs.surahNumber == 95 || ayahs.surahNumber == 97) {
      return const Basmala(isSecondTypeBasmala: true);
    }

    return const Basmala();
  }
}

class Basmala extends StatelessWidget {
  const Basmala({super.key, this.isSecondTypeBasmala = false});

  final bool isSecondTypeBasmala;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SvgPicture.asset(
        isSecondTypeBasmala
            ? AppImageAssets.basmala3Svg
            : AppImageAssets.basmala2Svg,
        colorFilter: ColorFilter.mode(
          context.theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
        width: 170,
      ),
    );
  }
}
