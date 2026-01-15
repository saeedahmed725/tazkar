import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/config/theme/app_theme.dart';

import '../core/utils/bloc/theme_bloc/theme_cubit.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
            onGenerateTitle: (context) => 'appTitle'.tr(),
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: AppTheme.light(state.accentColor.color),
            darkTheme: AppTheme.dark(state.accentColor.color),
            themeMode: state.mode,
          );
        },
      ),
    );
  }
}
