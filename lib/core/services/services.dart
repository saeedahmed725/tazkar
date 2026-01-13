import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tazkar/core/services/db_helper.dart';
import 'package:tazkar/core/services/font_services.dart';
import 'package:tazkar/core/services/locator.dart';
import 'package:tazkar/core/services/shared_prefs.dart';

class MyServices {
  MyServices._internal();

  static final MyServices instance = MyServices._internal();

  Future<MyServices> init() async {
    ServiceLocator.setup();
    FontServices.initQuranFonts();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SharedPrefs.init();
    await Future.wait([
      dotenv.load(fileName: ".env"),
      DbHelper.instance.initDBDirectories(),
    ]);
    return this;
  }
}
