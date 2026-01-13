import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/utils/extension/extension.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding ?? REdgeInsets.all(30),
        decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColor.kContainerDarkColor
                : AppColor.kContainerLightColor,
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator.adaptive(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColor.kPrimaryColor)),
            10.height,
            const Text("جاري التحميل")
          ],
        ),
      ),
    );
  }
}
