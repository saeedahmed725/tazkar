import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:tazkar/core/constants/app_image_assets.dart';

class HomeController {
  static HomeController? _instance;

  HomeController._();

  static HomeController get instance => _instance ??= HomeController._();

  void dispose() {
    selectedIndexNotifier.dispose();
    _instance = null;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List get itemsSolidIcons => [
        FlutterIslamicIcons.solidCommunity,
        AppImageAssets.statisticsSolidIcon,
        AppImageAssets.bookmarkSolidIcon,
        AppImageAssets.profileSolidIcon,
        AppImageAssets.settingsSolidIcon,
      ];

  List get itemsOutlinedIcons => [
        FlutterIslamicIcons.community,
        AppImageAssets.statisticsOutlinedIcon,
        AppImageAssets.bookmarkOutlinedIcon,
        AppImageAssets.profileOutlinedIcon,
        AppImageAssets.settingsOutlinedIcon,
      ];

  final ValueNotifier<int> _currentPageIndexNotifier = ValueNotifier<int>(0);

  ValueNotifier<int> get selectedIndexNotifier => _currentPageIndexNotifier;

  int get currentPageIndex => _currentPageIndexNotifier.value;

  bool isPageSelected(int index) => _currentPageIndexNotifier.value == index;

  void setPageIndex(int index) => _currentPageIndexNotifier.value = index;

  void addListener(VoidCallback listener) {
    _currentPageIndexNotifier.addListener(listener);
  }

  void removeListener(VoidCallback listener) {
    _currentPageIndexNotifier.removeListener(listener);
  }
}
