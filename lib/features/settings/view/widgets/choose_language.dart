import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/config/language/app_language.dart';

import '../../../../core/constants/app_static.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStatic.kChangeLanguage,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _languageRadioTile(
            context: context,
            title: AppStatic.kEnglish,
            value: AppLanguage.englishLocal,
            groupValue: context.locale,
          ),

          _languageRadioTile(
            context: context,
            title: AppStatic.kArabic,
            value: AppLanguage.arabicLocal,
            groupValue: context.locale,
          ),
        ],
      ),
    );
  }

  Widget _languageRadioTile({
    required BuildContext context,
    required String title,
    required Locale value,
    required Locale groupValue,
  }) {
    return RadioListTile<Locale>.adaptive(
      tileColor: context.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: (local) async {
        if (local != null) {
          context.setLocale(local);
          GoRouter.of(context).pop();
        }
      },
    );
  }
}
