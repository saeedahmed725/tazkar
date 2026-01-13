import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/features/auth/view/widgets/custom_auth_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              AppImageAssets.aqsaBackgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ArabicResponsiveText(
                  text: context.tr.registerMessage,
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontFamily: AppFonts.kSAFonts,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.44),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAuthButton(
                      height: 60,
                      width: context.width * 0.45,
                      label: context.tr.login,
                      buttonColor: AppColor.kPrimaryColor,
                      labelColor: Colors.white,
                      onPressed: () => context.toNamed(AppRoutes.login),
                    ),
                    CustomAuthButton(
                      height: 60,
                      width: context.width * 0.45,
                      label: context.tr.signUp,
                      buttonColor: AppColor.kPrimaryColor,
                      labelColor: Colors.white,
                      onPressed: () => context.toNamed(AppRoutes.signUp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
