import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/classes/colorful_safe_area.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/constants/app_static.dart';
import 'package:tazkar/core/services/locator.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/correction_model.dart';
import 'package:tazkar/features/quran/views/controller/mushaf_controller.dart';
import 'package:tazkar/features/quran/views/widgets/mushaf_widgets/mushaf_page_footer_details.dart';
import 'package:tazkar/features/quran/views/widgets/mushaf_widgets/mushaf_page_header_details.dart';

import '../bloc/evaluate_recitation/evaluate_recitation_bloc.dart';

class MushafScreen extends StatefulWidget {
  const MushafScreen({super.key});

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 300), () => setState(() => isVisible = true));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      int pageNumber = arguments['pageNumber'];
      MushafController.instance.goToPage(pageNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kMushafBackgroundColor,
      body: ColorfulSafeArea(
        color: AppColor.kAppBarColor,
        child: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          splashColor: AppColor.kAppBarColor.withOpacity(0.06),
          highlightColor: AppColor.kAppBarColor.withOpacity(0.06),
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

class OverlayWidgets extends StatelessWidget {
  const OverlayWidgets({super.key, required this.isVisible});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopOverlayCard(isVisible: isVisible),
        BottomOverlayCard(isVisible: isVisible)
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
        color: AppColor.kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class BottomOverlayCard extends StatefulWidget {
  const BottomOverlayCard({super.key, required this.isVisible});

  final bool isVisible;

  @override
  State<BottomOverlayCard> createState() => _BottomOverlayCardState();
}

class _BottomOverlayCardState extends State<BottomOverlayCard>
    with TickerProviderStateMixin {
  bool isRecording = false;
  late AnimationController _pulseController;
  late AnimationController _scaleController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Pulse animation for the recording indicator
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Scale animation for mic tap feedback
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _startRecordingAnimation() {
    _pulseController.repeat(reverse: true);
  }

  void _stopRecordingAnimation() {
    _pulseController.stop();
    _pulseController.reset();
  }

  void _onMicTap() {
    // Scale animation for tap feedback
    _scaleController.forward().then((_) {
      _scaleController.reverse();
    });

    final bloc = context.read<EvaluateRecitationBloc>();
    if (isRecording) {
      bloc.add(EvaluateRecitationEnd(pageNumber: currentVerse));
    } else {
      bloc.add(EvaluateRecitationStart());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EvaluateRecitationBloc, EvaluateRecitationState>(
      listener: (context, state) {
        final bloc = context.read<EvaluateRecitationBloc>();
        final wasRecording = isRecording;
        setState(() {
          isRecording = bloc.isRecording;
        });

        // Start/stop animation based on recording state
        if (isRecording && !wasRecording) {
          _startRecordingAnimation();
        } else if (!isRecording && wasRecording) {
          _stopRecordingAnimation();
        }
      },
      child: AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        bottom: widget.isVisible ? 10 : -100,
        left: 0,
        right: 0,
        child: MushafOverlayCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArabicResponsiveText(
                text: context.tr.recitation,
                fontSize: 16,
                fontFamily: AppFonts.uthmanicFonts,
                color: Colors.white,
              ),
              10.widthGap,
              // Animated mic container
              AnimatedBuilder(
                animation:
                    Listenable.merge([_pulseController, _scaleController]),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Pulsing circle background when recording
                        if (isRecording)
                          Transform.scale(
                            scale: _pulseAnimation.value,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),

                        // Mic icon with tap area
                        InkWell(
                          onTap: _onMicTap,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child: SvgPicture.asset(
                                key: ValueKey(isRecording),
                                isRecording
                                    ? AppImageAssets.micSolidIcon
                                    : AppImageAssets.micOutlinedIcon,
                                height: 25,
                                colorFilter: ColorFilter.mode(
                                  isRecording ? Colors.red : Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Recording indicator dots around mic (optional)
                        if (isRecording)
                          ...List.generate(3, (index) {
                            return AnimatedBuilder(
                              animation: _pulseController,
                              builder: (context, child) {
                                final delay = index * 0.3;
                                final animationValue =
                                    (_pulseController.value + delay) % 1.0;
                                return Positioned(
                                  top: 2 +
                                      (math.sin(animationValue * 2 * math.pi) *
                                          3),
                                  right: 5 + (index * 3.0),
                                  child: Container(
                                    width: 3,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(
                                        0.3 + 0.7 * (1 - animationValue),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopOverlayCard extends StatelessWidget {
  const TopOverlayCard({
    super.key,
    required this.isVisible,
  });

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: isVisible ? 10 : -100,
      left: 0,
      right: 0,
      child: MushafOverlayCard(
        child: Row(
          children: [
            SvgPicture.asset(AppImageAssets.searchIcon,
                height: 20,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            Spacer(),
            SvgPicture.asset(AppImageAssets.menuLineIcon,
                height: 15,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ],
        ),
      ),
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
            glyphs: ServiceLocator.globalQuranData.getAyahGlyphsForPage(index),
            index: index);
      },
    );
  }
}

int currentVerse = 2;

class MushafPainter extends StatefulWidget {
  final List<AyahGlyph> glyphs;
  final int index;

  const MushafPainter({
    super.key,
    required this.glyphs,
    required this.index,
  });

  @override
  State<MushafPainter> createState() => _MushafPainterState();
}

class _MushafPainterState extends State<MushafPainter> {
  List<CorrectionModel> corrections = [];
  late List<bool> versesIsVisible;
  bool firstRecord = true;

  @override
  void initState() {
    versesIsVisible = initVersesVisibility(true);
    super.initState();
  }

  List<bool> initVersesVisibility(bool visible) {
    return List.generate(
        extractUniqueAyahNumbers(widget.glyphs).length, (index) => visible);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EvaluateRecitationBloc, EvaluateRecitationState>(
      listener: (context, state) {
        if (state is EvaluateRecitationSuccess) {
          corrections = state.verses;
          log(state.verses[0].words[0].wordNumber.toString());
          for (int i = 0; i < corrections.length; i++) {
            final correction = corrections[i];
            if (correction.pageNumber == widget.index + 1) {
              final ayahIndex = extractUniqueAyahNumbers(widget.glyphs)
                  .indexOf(correction.ayahNumber);
              if (ayahIndex != -1) {
                versesIsVisible[ayahIndex] = true;
              }
            }
          }
          currentVerse++;
        }
        if (state is EvaluateRecitationStarting) {
          if (firstRecord) {
            firstRecord = false;
            versesIsVisible = initVersesVisibility(false);
          }
        }
        if (state is EvaluateRecitationError) {
          log('Error: ${state.message}', name: 'MushafPainter');
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          context.showSnackBar(state.message);
          versesIsVisible = initVersesVisibility(true);
        }
      },
      builder: (context, state) {
        return Container(
          padding: _getPadding(context),
          margin: _getMargin(context),
          child: Column(
            children: [
              12.heightGap,
              MushafPageHeaderDetails(
                  glyphs: widget.glyphs[15], index: widget.index),
              Spacer(),
              ..._buildAyahGlyphWithEndsRows(),
              Spacer(),
              MushafPageFooterDetails(pageIndex: widget.index),
              12.heightGap,
            ],
          ),
        );
      },
    );
  }

  List<int> extractUniqueAyahNumbers(List<AyahGlyph> glyphs) {
    final ayahNumbers = <int>{};

    for (var g in glyphs) {
      if (g.glyphTypeId == AppStatic.GLYPH_TYPE_WORD && g.ayahNumber != null) {
        final ayahNum = int.tryParse(g.ayahNumber!);
        if (ayahNum != null) {
          ayahNumbers.add(ayahNum);
        }
      }
    }

    final sorted = ayahNumbers.toList()..sort();
    return sorted;
  }

  bool _isCorrectionForCurrentPage() {
    return corrections
        .any((correction) => correction.pageNumber == widget.index + 1);
  }

  List<Widget> _buildAyahGlyphWithEndsRows() {
    if (!_isCorrectionForCurrentPage()) {
      corrections.clear();
    }
    int rowCount = (widget.index == 0 || widget.index == 1) ? 8 : 15;

    return List.generate(rowCount, (rowNumber) {
      List<AyahGlyph> ayahs = widget.glyphs
          .where((glyph) => glyph.lineNumber == rowNumber + 1)
          .toList();

      List<bool> selectedVerses = List.generate(ayahs.length, (index) => false);
      Map<int, int> ayahIndexMap = {};
      int currentIndex = 0;

      for (var ayah in ayahs) {
        if (ayah.glyphTypeId == AppStatic.GLYPH_TYPE_BISM_ALLAH) {
          return BasmalaWidget(ayahs: ayah);
        } else if (ayah.glyphTypeId == AppStatic.GLYPH_TYPE_SURAH) {
          return SurahBannerPlace(ayah: ayah);
        }
      }

      return FittedBox(
        child: Row(
          children: List.generate(
            ayahs.length,
            (wordIndex) {
              if (ayahs[wordIndex].glyphTypeId ==
                  AppStatic.GLYPH_TYPE_AYAH_NUMBER) {
                return EndOfAyahNumber(
                  ayahNumber: ayahs[wordIndex].ayahNumber.toString(),
                );
              }

              final ayahNum = int.tryParse(ayahs[wordIndex].ayahNumber ?? '');
              final wordNum = int.tryParse(ayahs[wordIndex].wordId ?? '');

              if (ayahNum != null && wordNum != null) {
                if (!ayahIndexMap.containsKey(ayahNum)) {
                  ayahIndexMap[ayahNum] = currentIndex;
                  currentIndex++;
                }

                final ayahIndex = ayahIndexMap[ayahNum]!;

                return AutoSizeText.rich(
                  TextSpan(
                    text: ayahs[wordIndex].code,
                    recognizer: LongPressGestureRecognizer(
                        duration: const Duration(milliseconds: 500))
                      ..onLongPressStart = (details) {
                        selectedVerses[wordIndex] = true;
                        log('Long Pressed ${ayahs[wordIndex].wordId}');
                      },
                  ),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  minFontSize: 16,
                  stepGranularity: 2,
                  maxFontSize: 25,
                  presetFontSizes: [22, 21, 20, 19, 18, 17, 16],
                  style: TextStyle(
                    height: 2,
                    fontFamily: 'P${widget.index + 1}',
                    wordSpacing: 0,
                    color: _getColorForWord(
                      ayahs[wordIndex],
                      ayahIndex,
                    ),
                    backgroundColor: selectedVerses[0]
                        ? AppColor.kOverlyColor.withOpacity(0.3)
                        : Colors.transparent,
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      );
    });
  }

  Color _getColorForWord(AyahGlyph ayah, int ayahIndex) {
    int ayahNumber = int.tryParse(ayah.ayahNumber.toString()) ?? 1;
    int wordId = int.tryParse(ayah.wordId.toString()) ?? 1;
    if (!versesIsVisible[ayahIndex]) {
      return Colors.transparent;
    }
    if (corrections.isEmpty) {
      return Colors.black;
    }

    for (final correction in corrections) {
      // if (correction.pageNumber != widget.index + 1) return Colors.black;
      // if (correction.surahNumber != widget.glyphs[0].surahNumber)  return Colors.black;
      if (correction.ayahNumber == ayahNumber) {
        for (final word in correction.words) {
          if (word.wordNumber == wordId) {
            switch (word.correctionValue) {
              case -3:
                return Colors.transparent;
              case -2:
                return Colors.orange;
              case -1:
              case 0:
                return Colors.red;
              case 1:
                return Colors.yellow;
              case 2:
                return Colors.green;
              default:
                return Colors.black;
            }
          }
        }
      }
    }
    return Colors.transparent;
  }

  EdgeInsets _getPadding(BuildContext context) {
    double horizontalPadding =
        (widget.index == 0 || widget.index == 1) ? 0.08 : 0.015;
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * horizontalPadding,
    );
  }

  EdgeInsets _getMargin(BuildContext context) {
    if (widget.index == 0 || widget.index == 1) {
      return EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.3,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.015,
    );
  }
}

class EndOfAyahNumber extends StatelessWidget {
  final String ayahNumber;

  const EndOfAyahNumber({super.key, required this.ayahNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImageAssets.icAyahNoSvg, height: 27),
          Text(
            AppFunctions.toArabicNumbers(ayahNumber),
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
              context.theme.colorScheme.onSurface, BlendMode.srcIn),
          width: 170),
    );
  }
}
