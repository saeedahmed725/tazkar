import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/features/home/view/screen/custom_app_bar.dart';
import 'package:tazkar/features/home/view/widgets/custom_bottom_nav_bar.dart';

class HomeShellView extends StatelessWidget {
  const HomeShellView({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: child.currentIndex == 1
          ? null
          : CustomAppBar(
              title: switch (child.currentIndex) {
                0 => 'home'.tr(),
                1 => 'prayer'.tr(),
                2 => 'qiblah'.tr(),
                3 => 'settings'.tr(),
                _ => '',
              },
            ),
      bottomNavigationBar: CustomBottomNavBar(navigationShell: child),
    );
  }
}
