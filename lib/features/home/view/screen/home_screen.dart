import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/core/classes/colorful_safe_area.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../quran/views/widgets/surahs_catalogue_widgets/appbar_wiegets/last_reading_surah_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: context.primaryColor,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageAssets.starsIconsBackground),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fromRect(
                  rect: Rect.fromLTWH(1 / 8 - 50, 170, 100, 100),
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.primaryContainer,
                          blurRadius: 20.0,
                        ),
                      ],
                      color: AppColors.kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 8)),
                      HomeSliverAppBar(),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                      SliverToBoxAdapter(child:  BlurBackground(
                        width: MediaQuery.of(context).size.width - 32,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: context.colorScheme.secondary.withValues(alpha: 0.5),
                          width: 1,
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
                              color: AppColors.primary.withValues(alpha: 0.3),
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
                                20.widthBox,
                                Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(12),
                                    child: Ink(
                                      width: 140,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'continue_reading'.tr(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Spacer(),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.asset(
                                              AppImageAssets.lastReadingAvatar,
                                              height: 45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                      PrayerSliverCard(),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                      HomeTopLayoutSliverList(),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                      HomeBottomLayoutSliverList(),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                      HomeStatisticsSliver(),
                      SliverToBoxAdapter(child: SizedBox(height: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
      child: Row(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed(AppRoutes.surahsList),
            child: _buildIconContainer(
              context: context,
              icon: FlutterIslamicIcons.solidQuran2,
              label: 'quran'.tr(),
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {},
            child: _buildIconContainer(
              context: context,
              imagePath: AppImageAssets.chatbotSolidIcon,
              label: 'chatbot'.tr(),
            ),
          ),
        ],
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
        color: context.colorScheme.primaryContainer,
        border: Border.all(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
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
              colorFilter: ColorFilter.mode(
                context.primaryColor,
                BlendMode.srcIn,
              ),
              width: 30,
              height: 30,
            ),
          if (icon != null) Icon(icon, color: context.primaryColor, size: 30),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: context.primaryColor,
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
            onTap: () => GoRouter.of(context).pushNamed(AppRoutes.qibla),
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
            color: context.colorScheme.primaryContainer,
            border: Border.all(
              color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: (imagePath != null)
              ? Image.asset(
                  imagePath,
                  color: context.primaryColor,
                  width: 30,
                  height: 30,
                )
              : Icon(icon, color: context.primaryColor, size: 30),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: context.colorScheme.primaryContainer,
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
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      snap: true,
      floating: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      flexibleSpace: BlurBackground(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colorScheme.secondary.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      actions: [
        // Notification badge
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 4.0),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
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
                  constraints: BoxConstraints(minWidth: 8, minHeight: 8),
                ),
              ),
            ],
          ),
        ),
        // Enhanced search button
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  AppImageAssets.searchIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ],
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar with glow effect
          CircleAvatar(
            radius: 22,
            backgroundColor: context.colorScheme.secondary.withValues(
              alpha: 0.3,
            ),
            child: Text(
              'س',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'greetings'.tr(namedArgs: {'name': 'سعيد'}),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
