import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/constants/app_static.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimingProps currentPrayer = TimingProps.asr;

  void cycleNextPrayer() {
    setState(() {
      int nextIndex = (currentPrayer.index + 1) % TimingProps.values.length;
      currentPrayer = TimingProps.values[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      appBar: HomeSliverAppBar(onPressed: cycleNextPrayer),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageAssets.starsIconsBackground),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned.fromRect(
              rect: currentPrayer.prayerPosition(MediaQuery.sizeOf(context)),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutBack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: currentPrayer.isDayTime
                          ? Colors.amberAccent.withValues(alpha: 0.2)
                          : Colors.blueGrey.withValues(alpha: 0.3),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Icon(
                    currentPrayer.isDayTime
                        ? Icons.wb_sunny
                        : Icons.nightlight_round,
                    key: ValueKey<bool>(currentPrayer.isDayTime),
                    color: currentPrayer.isDayTime
                        ? Colors.amber
                        : Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 12)),
                  PrayerSliverCard(),
                  SliverToBoxAdapter(child: SizedBox(height: 12)),
                  HomeTopLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 12)),
                  HomeBottomLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 12)),
                ],
              ),
            ),
          ],
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

class HomeSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSliverAppBar({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // snap: true,
      // floating: true,
      // collapsedHeight: 120,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      flexibleSpace: BlurBackground(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
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
                onPressed: onPressed,
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
