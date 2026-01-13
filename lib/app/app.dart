import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/config/theme/app_theme.dart';
import 'package:tazkar/core/utils/extension/extension.dart';

import '../l10n/app_localizations.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateTitle: (context) => context.tr.appTitle,
        locale: Locale("ar"), // PlatformDispatcher.instance.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: AppRoutes.download,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
