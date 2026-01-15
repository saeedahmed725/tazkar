import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:tazkar/core/services/db_helper.dart';
import 'package:tazkar/core/services/font_services.dart';

import '../locator/locator.dart';
import '../utils/bloc/bloc_observer/bloc_observer.dart';
import '../utils/helpers/shared_pref.dart';

class MyServices {
  MyServices._internal();

  static final MyServices instance = MyServices._internal();

  Future<MyServices> init() async {
    /// Initialize Service Locator
    ServiceLocator.setup();

    /// Initialize Quran Fonts
    FontServices.initQuranFonts();

    /// Set Preferred Orientations
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// Initialize Shared Preferences and Database Directories
    await Future.wait([
      SharedPrefs.init(),
      DbHelper.instance.initDBDirectories(),
    ]);

    // Initialize Bloc Observer
    Bloc.observer = AppBlocObserver();

    return this;
  }
}
