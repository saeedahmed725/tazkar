import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/features/home/view/controller/home_controller.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';

import '../../../../config/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: context.primaryColor,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ValueListenableBuilder<int>(
        valueListenable: controller.selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder:
                (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: Colors.transparent,
                    child: child,
                  );
                },
            child: getPages(selectedIndex),
          );
        },
      ),
    );
  }

  Widget getPages(int index) {
    return [
      HomePage(),
      StatisticsPage(),
      FavoritePage(),
      ProfilePage(),
      SettingsPage(),
    ][index];
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      color: AppColors.kOffWhiteColor,
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
                scrollBehavior: ScrollBehavior(),
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 8)),
                  HomeSliverAppBar(),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  PrayerSliverCard(),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  HomeTopLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  HomeBottomLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  HomeStatisticsSliver(),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
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
            color: AppColors.kOffWhiteColor,
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
            onTap: () => context.pushNamed(AppRoutes.surahsList),
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
        color: AppColors.kOffWhiteColor,
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
          if (icon != null)
            Icon(icon, color: context.primaryColor, size: 30),
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
            onTap: () => context.pushNamed(AppRoutes.qibla),
            child: _buildSmallIconContainer(
              context: context,
              icon: FlutterIslamicIcons.solidKaaba,
              label: 'qibla'.tr(),
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.prayer),
            child: _buildSmallIconContainer(
              context: context,
              icon: FlutterIslamicIcons.solidKowtow,
              label: 'prayer'.tr(),
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.calendar),
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
            color: AppColors.kOffWhiteColor,
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
            color: AppColors.kOffWhiteColor,
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
      centerTitle: true,
      snap: true,
      floating: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      flexibleSpace: BlurBackground(borderRadius: BorderRadius.circular(20)),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 10.0),
          child: IconButton(
            icon: SvgPicture.asset(
              AppImageAssets.searchIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
        ),
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'As-salamu alaykum',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'username',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
      leading: IconButton(
        icon: Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            context.locale.languageCode == "ar" ? -1.0 : 1.0,
            1.0,
            1.0,
          ),
          child: SvgPicture.asset(
            AppImageAssets.menuLineIcon,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        onPressed: () =>
            HomeController.instance.scaffoldKey.currentState?.openDrawer(),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    List<String> itemsNames = [
      'home'.tr(),
      'statistics'.tr(),
      'favorites'.tr(),
      'profile'.tr(),
      'settings'.tr(),
    ];
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, -10.0),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: List.generate(5, (index) {
          return ValueListenableBuilder<int>(
            valueListenable: controller.selectedIndexNotifier,
            builder: (context, selectedIndex, child) {
              final solisIcon = controller.itemsSolidIcons[index];
              final outlinedIcons = controller.itemsOutlinedIcons[index];
              final isSelected = selectedIndex == index;
              return CustomBottomNavButton(
                icon: solisIcon is IconData
                    ? (isSelected ? solisIcon : outlinedIcons)
                    : null,
                image: solisIcon is String
                    ? (isSelected ? solisIcon : outlinedIcons)
                    : null,
                label: itemsNames[index],
                isSelect: isSelected,
                onTap: () => controller.setPageIndex(index),
              );
            },
          );
        }),
      ),
    );
  }
}

class CustomBottomNavButton extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String label;
  final bool isSelect;
  final VoidCallback? onTap;

  const CustomBottomNavButton({
    super.key,
    this.icon,
    this.image,
    required this.label,
    required this.isSelect,
    this.onTap,
  }) : assert(icon != null || image != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                15.heightBox,
                if (image != null)
                  SvgPicture.asset(
                    image!,
                    colorFilter: ColorFilter.mode(
                      isSelect ? context.primaryColor : Colors.grey,
                      BlendMode.srcIn,
                    ),
                    width: 22,
                    height: 22,
                  ),
                if (icon != null)
                  Icon(
                    icon,
                    color: isSelect ? context.primaryColor : Colors.grey,
                    size: 22
                  ),
                5.heightBox,
                Text(
                  label,
                  style: TextStyle(
                    color: isSelect ? context.primaryColor : Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (2).heightBox,
                Container(
                  height: 4,
                  width: 50,
                  margin: EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isSelect
                        ? AppColors.kSecondaryColor
                        : Colors.transparent,
                    shape: BoxShape.rectangle,
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
