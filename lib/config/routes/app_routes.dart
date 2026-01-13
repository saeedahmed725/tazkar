import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/services/dio_factory.dart';
import 'package:tazkar/core/services/network_client.dart';
import 'package:tazkar/features/auth/view/screen/login_screen.dart';
import 'package:tazkar/features/auth/view/screen/register_screen.dart';
import 'package:tazkar/features/auth/view/screen/sign_up_screen.dart';
import 'package:tazkar/features/download/data/repo/download_repo_imp.dart';
import 'package:tazkar/features/download/view/bloc/download/download_bloc.dart';
import 'package:tazkar/features/download/view/bloc/percent/percent_bloc.dart';
import 'package:tazkar/features/download/view/screen/download_screen.dart';
import 'package:tazkar/features/home/view/screen/home_screen.dart';
import 'package:tazkar/features/quran/data/datasource/quran_local_datasource.dart';
import 'package:tazkar/features/quran/data/datasource/quran_remote_datasource.dart';
import 'package:tazkar/features/quran/data/repo/mushaf_repo_imp.dart';
import 'package:tazkar/features/quran/views/bloc/evaluate_recitation/evaluate_recitation_bloc.dart';
import 'package:tazkar/features/quran/views/bloc/juz_infos/juz_infos_bloc.dart';
import 'package:tazkar/features/quran/views/bloc/quran_global/quran_global_bloc.dart';
import 'package:tazkar/features/quran/views/bloc/surah_infos/surah_infos_bloc.dart';
import 'package:tazkar/features/quran/views/screens/mushaf_screen.dart';
import 'package:tazkar/features/quran/views/screens/surahs_catalogue.dart';
import 'package:tazkar/features/splash/view/screen/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String download = '/download';
  static const String splash = '/splash';
  static const String onBoarding = 'onboarding';
  static const String register = 'register';
  static const String login = 'login';
  static const String signUp = 'signup';
  static const String resetPassword = 'resetPassword';
  static const String otp = 'otp';
  static const String home = 'home';
  static const String quran = '/quran';
  static const String qibla = '/qibla';
  static const String calendar = '/calendar';
  static const String surahsList = '/surahsList';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String activities = '/activities';
  static const String favorite = '/favorite';
  static const String prayer = '/prayer';
  static const String about = '/about';

  // A method to define all routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log('Route: ${settings.name}', name: 'App Routes');
    switch (settings.name) {
      case download:
        return FadeRoute(
            page: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => DownloadBloc(DownloadRepoImp())),
                BlocProvider(create: (context) => PercentBloc()),
              ],
              child: DownloadScreen(),
            ),
            settings: settings);
      case splash:
        return FadeRoute(
            page: BlocProvider(
                create: (context) =>
                    QuranGlobalBloc(MushafRepoImp(
                      local: QuranLocalDataSource(),
                      remote: QuranRemoteDatasource(
                          client: NetworkClient(DioFactory.getDio())),
                    )),
                child: SplashScreen()),
            settings: settings);
      case register:
        return FadeRoute(
          page: RegisterScreen(),
          settings: settings,
        );
      case login:
        return SlideRoute(
          page: LoginScreen(),
          settings: settings,
        );

      case signUp:
        return SlideRoute(
          page: SignUpScreen(),
          settings: settings,
        );

      case home:
        return SlideRoute(
            begin: const Offset(0, 1), page: HomeScreen(), settings: settings);
      case quran:
        return SlideRoute(page: BlocProvider(
          create: (context) => EvaluateRecitationBloc(),
          child: MushafScreen(),
        ), settings: settings);
      case surahsList:
        return SlideRoute(
            page: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      SurahInfosBloc(MushafRepoImp(
                        local: QuranLocalDataSource(),
                        remote: QuranRemoteDatasource(
                            client: NetworkClient(DioFactory.getDio())),
                      )),
                ),
                BlocProvider(
                  create: (context) =>
                      JuzInfosBloc(
                        MushafRepoImp(
                          local: QuranLocalDataSource(),
                          remote: QuranRemoteDatasource(
                              client: NetworkClient(DioFactory.getDio())),
                        ),
                      ),
                ),
              ],
              child: SurahsCatalogue(),
            ),
            settings: settings);
      default:
        return _errorRoute();
    }
  }

  // Error route if the route is not found
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(
            appBar: AppBar(
              title: Text('ملاحظة'),
            ),
            body: Center(
              child: Text('سوف تتوفر قريبا'),
            ),
          ),
    );
  }
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Offset? begin;
  @override
  final RouteSettings settings;

  SlideRoute({required this.page, required this.settings, this.begin})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
    page,
    settings: settings,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: begin ?? const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  @override
  final RouteSettings settings;

  FadeRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
    page,
    settings: settings,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
