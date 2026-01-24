import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/appbar_wiegets/flexible_space_background.dart';

import '../../../../../../core/constants/app_colors.dart';

class CustomSurahsCatalogueAppBar extends StatelessWidget {
  const CustomSurahsCatalogueAppBar(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      toolbarHeight: context.height * 0.13,
      title: Text(
        "الرَّحْمَٰنُ\nعَلَّمَ الْقُرْآنَ",
        style: TextStyle(
            height: 2,
            fontFamily: AppFonts.neiriziQuranFonts,
            shadows: [
              Shadow(
                  color: AppColors.kSecondaryColor,
                  offset: const Offset(-0.5, -0.5),
                  blurRadius: 0.5)
            ]),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      foregroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        // Padding(
        //   padding: EdgeInsetsDirectional.only(end: 10.0),
        //   child: IconButton(
        //     icon: SvgPicture.asset(
        //       AppAssets.searchIcon,
        //       colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //     ),
        //     onPressed: () {},
        //   ),
        // )
      ],
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(text: 'surahs'.tr()),
            Tab(text: 'juzs'.tr()),
          ],
        ),
      ),
      expandedHeight: context.height * 0.4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          child: FlexibleSpaceBackground(scrollController: scrollController),
        ),
      ),
    );
  }
}
