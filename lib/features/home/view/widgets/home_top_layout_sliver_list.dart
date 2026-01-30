import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/config/routes/app_routes.dart';

class HomeTopLayoutSliverList extends StatelessWidget {
  const HomeTopLayoutSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          spacing: 8,
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
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(color: context.secondary, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.primaryColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (imagePath != null)
            SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(context.secondary, BlendMode.srcIn),
              width: 30,
              height: 30,
            ),
          if (icon != null) Icon(icon, color: context.secondary, size: 30),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
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
