import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/app/app.dart';

import 'config/language/app_language.dart';
import 'core/services/my_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await MyServices.instance.init();

  runApp(
    EasyLocalization(
      supportedLocales: AppLanguage.locals,
      fallbackLocale: AppLanguage.arabicLocal,
      path: AppLanguage.localizationPath,
      child: const QuranApp(),
    ),
  );
}
