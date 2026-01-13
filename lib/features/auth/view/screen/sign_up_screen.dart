import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/services/network_client.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/features/auth/data/repo/auth_repo_imp.dart';
import 'package:tazkar/features/auth/data/source/auth_remote_data_source.dart';
import 'package:tazkar/features/auth/view/bloc/authentication_bloc.dart';
import 'package:tazkar/features/auth/view/widgets/custom_auth_button.dart';
import 'package:tazkar/features/auth/view/widgets/sign_up_text_fields.dart';

import '../../../../core/services/dio_factory.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        AuthRepoImp(
            remote: AuthRemoteDataSource(
                client: NetworkClient(DioFactory.getDio()))),
      ),
      child: Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: context.height * 0.35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImageAssets.starsIconsBackground),
                      fit: BoxFit.cover,
                      opacity: 0.5, // Adjust the opacity as needed
                    ),
                  ),
                  child: ArabicResponsiveText(
                    text: 'Application Name\nLogo',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontFamily: AppFonts.kSAFonts,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border(
                        top: BorderSide(
                            color: AppColor.kSecondaryColor.withOpacity(0.6),
                            width: 1.0),
                      ),
                      image: const DecorationImage(
                        image: AssetImage(AppImageAssets.nakshBackgroundImage),
                        fit: BoxFit.cover,
                        opacity: 0.07,
                      ),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: Builder(builder: (context) {
                      final authBloc = context.read<AuthenticationBloc>();
                      return Column(
                        children: [
                          Spacer(),
                          ArabicResponsiveText(
                            text: context.tr.register,
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontFamily: AppFonts.kSAFonts,
                            fontWeight: FontWeight.bold,
                          ),
                          Expanded(
                              flex: 4,
                              child: SignUpTextFields(authBloc: authBloc)),
                          CustomAuthButton(
                            label: context.tr.register,
                            onPressed: () {
                              if (authBloc.formKey.currentState!.validate()) {
                                authBloc.add(RegisterEvent());
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${context.tr.alreadyHaveAccount} ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: context.tr.login,
                                    style: TextStyle(
                                      color: AppColor.kSecondaryColor,
                                      fontSize: 20.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .toNamedAndOff(AppRoutes.login),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      );
                    }),
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
