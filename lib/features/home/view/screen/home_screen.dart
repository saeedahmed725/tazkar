import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';
import 'package:tazkar/features/home/view/widgets/prayer_tracker.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../prayer_timings/view/screen/prayer_screen.dart';
import '../widgets/ayat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollBehavior(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        slivers: [
          HomeSliverAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          HomeTopLayoutSliverList(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          HomeBottomLayoutSliverList(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          PrayerTracker(),
          PrayerTracker(),
          PrayerTracker(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          AyaDayCard(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
        ],
      ),
    );
  }
}

class HomeStatisticsSliver extends StatelessWidget {
  const HomeStatisticsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: BlurBackground(
            width: MediaQuery.of(context).size.width - 32,
            height: 269,
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
              width: 1,
            ),
            child: Center(
              child: Text(
                'statistics'.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTopLayoutSliverList extends StatelessWidget {
  const HomeTopLayoutSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () =>
                    GoRouter.of(context).pushNamed(AppRoutes.surahsList),
                child: _buildIconContainer(
                  context: context,
                  icon: FlutterIslamicIcons.solidQuran2,
                  label: 'quran'.tr(),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () =>
                    GoRouter.of(context).pushNamed(AppRoutes.dhikrCategories),
                child: _buildIconContainer(
                  context: context,
                  icon: FlutterIslamicIcons.solidTasbihHand,
                  label: 'azkar'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer({
    required BuildContext context,
    IconData? icon,
    String? imagePath,
    required String label,
  }) {
    return Container(
      height: 70,
      width: (MediaQuery.of(context).size.width - 32) / 2 - 8,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          color: context.secondary.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (imagePath != null)
            SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 30,
              height: 30,
            ),
          if (icon != null) Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBottomLayoutSliverList extends StatelessWidget {
  const HomeBottomLayoutSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: _buildSmallIconContainer(
                context: context,
                icon: Icons.menu_book,
                label: 'قصص الانبياء',
              ),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.qiblah),
              child: _buildSmallIconContainer(
                context: context,
                icon: FlutterIslamicIcons.solidKaaba,
                label: 'qibla'.tr(),
              ),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.prayer),
              child: _buildSmallIconContainer(
                context: context,
                icon: FlutterIslamicIcons.solidKowtow,
                label: 'prayer'.tr(),
              ),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.calendar),
              child: _buildSmallIconContainer(
                context: context,
                icon: FlutterIslamicIcons.calendar,
                label: 'calendar'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallIconContainer({
    required BuildContext context,
    IconData? icon,
    String? imagePath,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70,
          width: (MediaQuery.of(context).size.width - 32) / 4 - 8,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: context.primaryColor,
            border: Border.all(
              color: context.secondary.withValues(alpha: 0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: (imagePath != null)
              ? Image.asset(
                  imagePath,
                  color: Colors.white,
                  width: 30,
                  height: 30,
                )
              : Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: context.onSurface.withValues(alpha: 0.8),
            fontSize: 14,
            fontFamily: AppFonts.kSAFonts,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.primaryColor,
      surfaceTintColor: context.primaryColor,
      expandedHeight: 250,
      pinned: true,
      floating: false,
      snap: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Align(
            alignment: Alignment.bottomCenter,
            child: PrayerSliverCard()),
      ),
      title:
          Text(
            "home".tr(),
            style: context.titleLarge?.copyWith(color: Colors.white),
          ) ??
          LocationNameWidget(),
      actions: [
        // Notification badge
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 4.0),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_on_sharp,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     // Avatar with glow effect
      //     CircleAvatar(
      //       radius: 22,
      //       backgroundColor: context.colorScheme.secondary.withValues(
      //         alpha: 0.3,
      //       ),
      //       child: Text(
      //         'س',
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //     SizedBox(width: 12),
      //     Expanded(
      //       child: Column(
      //         spacing: 2,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Text(
      //             'greetings'.tr(namedArgs: {'name': 'سعيد'}),
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
