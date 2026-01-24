import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_fonts.dart';

class HomeBottomLayoutSliverList extends StatelessWidget {
  const HomeBottomLayoutSliverList({super.key});

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
                onTap: () {},
                child: _buildSmallIconContainer(
                  context: context,
                  icon: Icons.menu_book,
                  label: 'hadith'.tr(),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed(AppRoutes.qiblah),
                child: _buildSmallIconContainer(
                  context: context,
                  icon: FlutterIslamicIcons.solidKaaba,
                  label: 'qibla'.tr(),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed(AppRoutes.prayer),
                child: _buildSmallIconContainer(
                  context: context,
                  icon: FlutterIslamicIcons.solidKowtow,
                  label: 'prayer'.tr(),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed(AppRoutes.calendar),
                child: _buildSmallIconContainer(
                  context: context,
                  icon: FlutterIslamicIcons.calendar,
                  label: 'calendar'.tr(),
                ),
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
      children: [
        Container(
          height: 75,
          width: double.infinity,
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
