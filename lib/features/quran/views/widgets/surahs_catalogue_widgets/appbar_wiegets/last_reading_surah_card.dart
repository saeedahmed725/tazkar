import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/extension/extension.dart';

class LastReadingSurahCard extends StatefulWidget {
  const LastReadingSurahCard({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<LastReadingSurahCard> createState() => _LastReadingSurahCardState();
}

class _LastReadingSurahCardState extends State<LastReadingSurahCard> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.position.addListener(_updateOpacity);
  }

  void _updateOpacity() {
    double maxScroll = 150.0;
    double offset = widget.scrollController.offset.clamp(0.0, maxScroll);
    double opacity = 1 - (offset / maxScroll);

    setState(() => _opacity = opacity.clamp(0.0, 1.0));
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateOpacity);
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: context.height * 0.18,
          margin: EdgeInsets.only(
            top: context.height * 0.195,
            left: 20,
            right: 20,
            bottom: 55,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.kScaffoldBackgroundColor.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImageAssets.basmalaSvg,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 35,
                  ),
                  Divider(
                    color: AppColor.kPrimaryColor.withOpacity(0.3),
                    endIndent: 60,
                    indent: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ﭑ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFonts.surahNamesFonts,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "الآية ٢٥٠",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFonts.kSAFonts,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      20.widthGap,
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Ink(
                            width: 140,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: AppColor.kPrimaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Text(context.tr.continue_reading,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    )),
                                Spacer(),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      AppImageAssets.lastReadingAvatar,
                                      height: 45,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
