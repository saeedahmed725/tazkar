import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_image_assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  List get itemsSolidIcons => [
    FlutterIslamicIcons.solidCommunity,
    AppImageAssets.statisticsSolidIcon,
    AppImageAssets.bookmarkSolidIcon,
    AppImageAssets.profileSolidIcon,
    AppImageAssets.settingsSolidIcon,
  ];

  List get itemsOutlinedIcons => [
    FlutterIslamicIcons.community,
    AppImageAssets.statisticsOutlinedIcon,
    AppImageAssets.bookmarkOutlinedIcon,
    AppImageAssets.profileOutlinedIcon,
    AppImageAssets.settingsOutlinedIcon,
  ];

  List<String> get itemsNames => [
    'home'.tr(),
    'statistics'.tr(),
    'favorites'.tr(),
    'profile'.tr(),
    'settings'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
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
            valueListenable: ValueNotifier(widget.child.currentIndex),
            builder: (context, selectedIndex, child) {
              final solisIcon = itemsSolidIcons[index];
              final outlinedIcons = itemsOutlinedIcons[index];
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
                onTap: () => widget.child.goBranch(index),
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                    size: 22,
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
