import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.label,
    this.onPressed,
    this.labelColor,
    this.buttonColor, this.width, this.height,
  });

  final String label;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color? labelColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(buttonColor ?? Colors.white),
          side: WidgetStateProperty.all(BorderSide.none),
        ),
        child: ArabicResponsiveText(
          text: label,
          color: labelColor ?? Colors.black,
          fontSize: 18.sp,
          fontFamily: AppFonts.kSAFonts,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
