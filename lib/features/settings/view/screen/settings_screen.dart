import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_static.dart';
import '../widgets/preferences_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const ProfileHeader(),
          // PreferencesCard(
          //   title: AppStatic.kGeneral,
          //   items: [
          // PreferencesItem(
          //   title: AppStatic.kAppearance,
          //   subtitle: context.read<ThemeCubit>().state.mode.name.tran,
          //   icon: context.read<ThemeCubit>().state.mode == ThemeMode.light
          //       ? SuperIcons.bs_sun_fill
          //       : SuperIcons.bx_moon_solid,
          //   onTap: () =>
          //       Sheets.showModel(context, child: const ChooseTheme()),
          // ),
          // PreferencesItem(
          //   title: AppStatic.kAccentColor,
          //   subtitle: context
          //       .read<ThemeCubit>()
          //       .state
          //       .accentColor
          //       .title
          //       .tran,
          //   trailing: CircleAvatar(
          //     radius: 10,
          //     backgroundColor: context.primaryColor,
          //   ),
          //   icon: SuperIcons.bx_brush_alt_solid,
          //   onTap: () => Sheets.showModel(
          //     context,
          //     isScrollControlled: true,
          //     child: const ChooseAccentColor(),
          //   ),
          // ),
          // PreferencesItem(
          //   title: AppStatic.kLanguage,
          //   subtitle: context.locale.languageCode.tran,
          //   icon: SuperIcons.cl_language_solid,
          //   onTap: () =>
          //       Sheets.showModel(context, child: const ChooseLanguage()),
          // ),
          //   ],
          // ),
          PreferencesCard(
            title: AppStatic.kAboutSecurity,
            items: [
              PreferencesItem(
                title: AppStatic.kPrivacyPolicy,
                icon: SuperIcons.bs_phone_fill,
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://sites.google.com/view/tadabr/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9',
                  ),
                ),
              ),
              PreferencesItem(
                title: AppStatic.kAboutApp,
                icon: SuperIcons.bs_info_circle_fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
