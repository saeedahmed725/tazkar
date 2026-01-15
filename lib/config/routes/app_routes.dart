import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/features/home/view/screen/home_screen.dart';
import 'package:tazkar/features/quran/views/bloc/juz_infos/juz_infos_bloc.dart';
import 'package:tazkar/features/quran/views/bloc/surah_infos/surah_infos_bloc.dart';
import 'package:tazkar/features/quran/views/screens/mushaf_screen.dart';
import 'package:tazkar/features/quran/views/screens/surahs_catalogue.dart';
import 'package:tazkar/features/splash/view/screen/splash_screen.dart';

import '../../core/locator/locator.dart';
import '../../features/splash/view/bloc/quran_global_bloc.dart';

class AppRoutes {
  AppRoutes._();

  static const String download = '/download';
  static const String splash = '/splash';
  static const String onBoarding = 'onboarding';
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

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [splashRoute, homeRoute, quranRoute, surahsListRoute],
    errorBuilder: (context, state) => _errorRoute(),
  );

  static final splashRoute = GoRoute(
    path: "/$splash",
    name: splash,
    builder: (context, state) => BlocProvider(
      create: (_) => ServiceLocator.get<QuranGlobalBloc>(),
      child: SplashScreen(),
    ),
  );

  static final homeRoute = GoRoute(
    path: "/$home",
    name: home,
    builder: (context, state) => HomeScreen(),
  );

  static final quranRoute = GoRoute(
    path: '/$quran',
    name: quran,
    builder: (context, state) => MushafScreen(
      pageNumber: state.uri.queryParameters['page_number'] != null
          ? int.tryParse(state.uri.queryParameters['page_number']!) ?? 1
          : 1,
    ),
  );

  static final surahsListRoute = GoRoute(
    path: '/$surahsList',
    name: surahsList,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ServiceLocator.get<SurahInfosBloc>()),
        BlocProvider(create: (_) => ServiceLocator.get<JuzInfosBloc>()),
      ],
      child: SurahsCatalogue(),
    ),
  );

  // Error route if the route is not found
  static Scaffold _errorRoute() {
    return Scaffold(
      appBar: AppBar(title: Text("Route Error")),
      body: Center(child: Text("Page not found")),
    );
  }
}
