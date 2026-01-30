import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: context.hoverColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(4, (index) {
          final isSelected = index == navigationShell.currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: !isSelected ? () => navigationShell.goBranch(index) : null,
              child: AnimatedContainer(
                padding: const EdgeInsets.all(8),
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: isSelected ? context.primaryColor : context.surface,
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected
                          ? switch (index) {
                              0 => FlutterIslamicIcons.solidCommunity,
                              1 => FlutterIslamicIcons.solidKowtow,
                              2 => FlutterIslamicIcons.solidQibla2,
                              3 => SuperIcons.cl_settings_solid,
                              _ => Icons.help_outline_rounded,
                            }
                          : switch (index) {
                              0 => FlutterIslamicIcons.community,
                              1 => FlutterIslamicIcons.kowtow,
                              2 => FlutterIslamicIcons.qibla2,
                              3 => SuperIcons.cl_settings_line,
                              _ => Icons.help_outline_rounded,
                            },
                      color: isSelected
                          ? context.surface
                          : context.primaryColor.withValues(alpha: 0.8),
                    ),
                    Text(
                      switch (index) {
                        0 => 'home'.tr(),
                        1 => 'prayer'.tr(),
                        2 => 'qiblah'.tr(),
                        3 => 'settings'.tr(),
                        _ => '',
                      },
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected
                            ? context.surface
                            : context.primaryColor.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
