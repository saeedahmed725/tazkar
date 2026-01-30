import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/utils/components/blur_background.dart';

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
