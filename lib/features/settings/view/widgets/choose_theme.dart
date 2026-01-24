import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/bloc/theme_bloc/theme_cubit.dart';

class ChooseTheme extends StatelessWidget {
  const ChooseTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeMode) {
          return Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Change Theme',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _themeRadioTile(
                context: context,
                title: 'Light',
                value: ThemeMode.light,
                groupValue: themeMode.mode,
              ),
              _themeRadioTile(
                context: context,
                title: 'Dark',
                value: ThemeMode.dark,
                groupValue: themeMode.mode,
              ),
              _themeRadioTile(
                context: context,
                title: 'System',
                value: ThemeMode.system,
                groupValue: themeMode.mode,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _themeRadioTile({
    required BuildContext context,
    required String title,
    required ThemeMode value,
    required ThemeMode groupValue,
  }) {
    return RadioListTile<ThemeMode>.adaptive(
      tileColor: context.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: (mode) {
        if (mode != null) {
          context.read<ThemeCubit>().setTheme(mode);
        }
      },
    );
  }
}
