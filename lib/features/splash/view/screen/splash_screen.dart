import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';
import 'package:tazkar/core/services/locator.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/features/quran/views/bloc/quran_global/quran_global_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuranGlobalBloc>().add(GetQuranAndAyahGlyphs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: BlocConsumer<QuranGlobalBloc, QuranGlobalState>(
        listener: (context, state) async {
          if (state is QuranTextAndAyahGlyphsLoaded) {
            final globalQuranData = ServiceLocator.globalQuranData;
            globalQuranData.setAyahGlyphs(state.ayahGlyphs);
            globalQuranData.setQuranText(state.quranText);
            return context.toNamedAndOffAll(AppRoutes.home);
            final token = await FlutterSessionJwt.retrieveToken();

            if (!context.mounted) return;

            if (token == null) {
              context.toNamedAndOffAll(AppRoutes.register);
            } else {
              final isTokenExpired = await FlutterSessionJwt.isTokenExpired();
              if (!context.mounted) return;

              if (isTokenExpired) {
                context.toNamedAndOffAll(AppRoutes.register);
              } else {
                context.toNamedAndOffAll(AppRoutes.home);
              }
            }
          } else if (state is AyahGlyphsError) {
            context.showSnackBar(state.failure.message);
          }
        },
        builder: (context, state) {
          if (state is AyahGlyphsError) {
            return AppFailureWidget(failure: state.failure);
          }

          return Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(AppImageAssets.aqsaBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(),
                Image.asset(
                  AppImageAssets.starsIconsBackground,
                  color: AppColor.kSecondaryColor.withOpacity(0.4),
                ),
                SvgPicture.asset(
                  AppImageAssets.basmalaSvg,
                ).animate().fadeIn(duration: 1000.ms),
                Positioned(
                  bottom: 500,
                  child: SvgPicture.asset(
                    AppImageAssets.mandalaIcon,
                    height: 500,
                    colorFilter: ColorFilter.mode(
                        AppColor.kSecondaryColor.withOpacity(0.2),
                        BlendMode.srcIn),
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

// Container(
//   alignment: Alignment.center,
//   height: 200,
//   width: 220,
//   margin: const EdgeInsets.only(top: 100),
//   padding: EdgeInsets.only(top: 10),
//   decoration: BoxDecoration(
//     color: AppColor.kPrimaryColor.withOpacity(0.9),
//     boxShadow: [
//       BoxShadow(
//         color:
//             AppColor.kScaffoldBackgroundColor.withOpacity(0.5),
//         blurRadius: 50,
//         spreadRadius: 8,
//       )
//     ],
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: Text(
//     ' إِنَّا نَحْنُ نَزَّلْنَا الذِّكْرَ\nوَإِنَّا لَهُ لَحَافِظُونَ ',
//     textAlign: TextAlign.center,
//     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//           height: 1.7,
//           color: AppColor.kSecondaryHomeCardColor,
//           fontFamily: AppFonts.neiriziQuranFonts,
//           fontWeight: FontWeight.bold,
//         ),
//   ),
// ),
// SvgPicture.asset(
//   AppImageAssets.mosqueIcon,
//   colorFilter:
//       ColorFilter.mode(AppColor.kPrimaryColor, BlendMode.srcIn),
//   width: double.maxFinite,
//   height: 200,
// )
