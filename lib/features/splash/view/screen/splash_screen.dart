import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/core/utils/components/toast.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/locator/locator.dart';
import '../../../../core/quran/global_quran_data.dart';
import '../bloc/quran_global_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuranGlobalBloc>().add(InitDB());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<QuranGlobalBloc, QuranGlobalState>(
        listener: (context, state) async {
          if (state.isLoaded) {
            final globalQuranData = ServiceLocator.get<GlobalQuranData>();
            globalQuranData.setAyahGlyphs(state.ayahGlyphs);
            globalQuranData.setQuranText(state.quranText);
            return context.goNamed(AppRoutes.home);
          } else if (state.isError && state.hasError) {
            ModernToast.show(
              context,
              title: 'Error',
              state: ToastState.error,
              message: state.failure!.message,
            );
          }
        },
        builder: (context, state) {
          if (state.isError && state.hasError) {
            return AppFailureWidget(failure: state.failure!);
          }

          if (state.isUnzipping) {
            return Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppAssets.aqsaBackgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.kSecondaryColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Initializing database... ${state.zipProgress}%',
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(AppAssets.aqsaBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(),
                Image.asset(
                  AppAssets.starsIconsBackground,
                  color: AppColors.kSecondaryColor.withValues(alpha: 0.4),
                ),
                SvgPicture.asset(
                  AppAssets.basmalaSvg,
                ).animate().fadeIn(duration: 1000.ms),
                Positioned(
                  bottom: 500,
                  child: SvgPicture.asset(
                    AppAssets.mandalaIcon,
                    height: 500,
                    colorFilter: ColorFilter.mode(
                      AppColors.kSecondaryColor.withValues(alpha: 0.2),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
