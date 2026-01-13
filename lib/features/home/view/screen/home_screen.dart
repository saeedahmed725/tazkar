import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
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
      backgroundColor: AppColor.kPrimaryColor,
      drawer: Menu(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ValueListenableBuilder<int>(
          valueListenable: controller.selectedIndexNotifier,
          builder: (context, selectedIndex, child) {
            return PageTransitionSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (
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
          }),
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
  const HomePage({
    super.key,
  });

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
              rect: Rect.fromLTWH(1.sw / 8 - 50.w, 170, 100.w, 100.h),
              child: Container(
                width: 60.w,
                height: 60.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.kOffWhiteColor,
                      blurRadius: 20.0,
                    ),
                  ],
                  color: AppColor.kSecondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                scrollBehavior: ScrollBehavior(),
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                  HomeSliverAppBar(),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  PrayerSliverCard(),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  HomeTopLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  HomeBottomLayoutSliverList(),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  HomeStatisticsSliver(),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
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
            width: 1.sw - 32.w,
            height: 269.h,
            color: AppColor.kOffWhiteColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
                color: AppColor.kSecondaryColor.withValues(alpha: 0.5), width: 1),
            child: Center(
              child: Text(
                context.tr.statistics,
                style: TextStyle(
                  color: Colors.black,
                ),
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
            onTap: () => context.toNamed(AppRoutes.surahsList),
            child: _buildIconContainer(
                icon: FlutterIslamicIcons.solidQuran2, label: context.tr.quran),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {},
            child: _buildIconContainer(
                imagePath: AppImageAssets.chatbotSolidIcon,
                label: context.tr.chatbot),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(
      {IconData? icon, String? imagePath, required String label}) {
    return Container(
      height: 70.h,
      width: (1.sw - 32.w) / 2 - 8.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColor.kOffWhiteColor,
        border: Border.all(
            color: AppColor.kSecondaryColor.withValues(alpha: 0.5), width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (imagePath != null)
            SvgPicture.asset(
              imagePath,
              colorFilter:
                  ColorFilter.mode(AppColor.kPrimaryColor, BlendMode.srcIn),
              width: 30.h,
              height: 30.h,
            ),
          if (icon != null)
            Icon(
              icon,
              color: AppColor.kPrimaryColor,
              size: 30.sp,
            ),
          SizedBox(width: 5.w),
          Text(
            label,
            style: TextStyle(
              color: AppColor.kPrimaryColor,
              fontSize: 16.sp,
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
                icon: Icons.menu_book, label: "قصص الانبياء"),
          ),
          GestureDetector(
            onTap: () => context.toNamed(AppRoutes.qibla),
            child: _buildSmallIconContainer(
                icon: FlutterIslamicIcons.solidKaaba, label: context.tr.qibla),
          ),
          GestureDetector(
            onTap: () => context.toNamed(AppRoutes.prayer),
            child: _buildSmallIconContainer(
                icon: FlutterIslamicIcons.solidKowtow,
                label: context.tr.prayer),
          ),
          GestureDetector(
            onTap: () => context.toNamed(AppRoutes.calendar),
            child: _buildSmallIconContainer(
                icon: FlutterIslamicIcons.calendar, label: context.tr.calendar),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIconContainer(
      {IconData? icon, String? imagePath, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70.h,
          width: (1.sw - 32.w) / 4 - 8.w,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColor.kOffWhiteColor,
            border: Border.all(
                color: AppColor.kSecondaryColor.withValues(alpha: 0.5), width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: (imagePath != null)
              ? Image.asset(
                  imagePath,
                  color: AppColor.kPrimaryColor,
                  width: 30.h,
                  height: 30.h,
                )
              : Icon(
                  icon,
                  color: AppColor.kPrimaryColor,
                  size: 30.sp,
                ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            color: AppColor.kOffWhiteColor,
            fontSize: 14.sp,
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
          side: BorderSide(color: AppColor.kSecondaryColor.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(20.r)),
      flexibleSpace: BlurBackground(borderRadius: BorderRadius.circular(20.r)),
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
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'username',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(context.locale == "ar" ? -1.0 : 1.0, 1.0, 1.0),
          child: SvgPicture.asset(AppImageAssets.menuLineIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
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
      context.tr.home,
      context.tr.statistics,
      context.tr.favorites,
      context.tr.profile,
      context.tr.settings,
    ];
    return Container(
      height: 70.h,
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: List.generate(
          5,
          (index) {
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
          },
        ),
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
          borderRadius: BorderRadius.circular(20.r),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (15.h).heightGap,
                if (image != null)
                  SvgPicture.asset(
                    image!,
                    colorFilter: ColorFilter.mode(
                        isSelect ? AppColor.kPrimaryColor : Colors.grey,
                        BlendMode.srcIn),
                    width: 22.h,
                    height: 22.h,
                  ),
                if (icon != null)
                  Icon(
                    icon,
                    color: isSelect ? AppColor.kPrimaryColor : Colors.grey,
                    size: 22.h,
                  ),
                5.heightGap,
                Text(
                  label,
                  style: TextStyle(
                    color: isSelect ? AppColor.kPrimaryColor : Colors.grey,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (2.h).heightGap,
                Container(
                  height: 4.h,
                  width: 50.w,
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: isSelect
                        ? AppColor.kSecondaryColor
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

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: AppColor.kPrimaryColor.withValues(alpha: 0.2),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.kPrimaryColor,
                    child: Icon(
                      Icons.face_4,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salma Ahmed', // User name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Online', // User status (optional)
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.heightGap,
              MenuItem(
                icon: Icons.language,
                title: 'Change Language',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.book,
                title: 'Quran',
                onTap: () {
                  context.toNamed(AppRoutes.quran);
                },
              ),
              MenuItem(
                icon: Icons.chat,
                title: 'Chatbot',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.explore,
                title: 'Qibla Direction',
                onTap: () {
                  context.toNamed(AppRoutes.prayer);
                },
              ),
              MenuItem(
                icon: Icons.access_time,
                title: 'Prayer Time',
                onTap: () {
                  context.toNamed(AppRoutes.prayer);
                },
              ),
              MenuItem(
                icon: Icons.favorite_border,
                title: 'Prophets Story',
                onTap: () {},
              ),
              16.heightGap,
              Divider(),
              16.heightGap,
              MenuItem(
                icon: Icons.logout,
                title: 'logout',
                onTap: () {
                  context.toNamed(AppRoutes.splash);
                },
              ),
              16.heightGap,
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Version 1.0.0', // App version
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Privacy Policy | Terms of Service', // Footer links
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.kOffWhiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.kPrimaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColor.kPrimaryColor,
            fontSize: 16.sp,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
