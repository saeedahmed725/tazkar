import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

import '../../../../core/utils/components/blur_background.dart';
import '../../../../core/utils/components/sheets.dart';
import '../../../../core/utils/components/transition_switcher.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Sheets.isBottomSheetOpen,
      builder: (context, value, _) {
        return TransitionSwitcher(
          duration: const Duration(milliseconds: 400),
          beginOffset: const Offset(0, 0.15),
          child: value
              ? const SizedBox.shrink()
              : isKeyboardOpen(context)
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: BlurBackground(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    color: context.hoverColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(300),
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final isSelected =
                            index == navigationShell.currentIndex;
                        return InkWell(
                          onTap: !isSelected
                              ? () => navigationShell.goBranch(index)
                              : null,
                          child: AnimatedContainer(
                            padding: const EdgeInsets.all(8),
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.primaryColor
                                  : context.surface,
                              borderRadius: BorderRadius.circular(300),
                            ),
                            child: Icon(
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
                          ),
                        );
                      }),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
