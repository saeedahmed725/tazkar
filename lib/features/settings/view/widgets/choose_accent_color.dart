import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_static.dart';
import '../../../../core/utils/bloc/theme_bloc/theme_cubit.dart';
import '../domain/entity/accent_color_entity.dart';

class ChooseAccentColor extends StatelessWidget {
  const ChooseAccentColor({super.key});

  List<AccentColorEntity> get accentColors => [
    const AccentColorEntity(title: 'charcoal_blue', color: Color(0xff3a576e)),
    const AccentColorEntity(title: 'forest_green', color: Color(0xff4b7f06)),
    const AccentColorEntity(title: 'gold', color: Color(0xffe6c800)),
    const AccentColorEntity(title: 'red', color: Color(0xffd32f2f)),
    const AccentColorEntity(title: 'blue', color: Color(0xff1976d2)),
    const AccentColorEntity(title: 'purple', color: Color(0xff9c27b0)),
    const AccentColorEntity(title: 'orange', color: Color(0xfff57c00)),
    const AccentColorEntity(title: 'teal', color: Color(0xff00796b)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStatic.kChooseAccentColor,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ...accentColors.map(
                (item) => _colorTile(
                  context: context,
                  entity: item,
                  isSelected: item == state.accentColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _colorTile({
    required BuildContext context,
    required AccentColorEntity entity,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().setAccentColor(entity);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(entity.title.tran),
            CircleAvatar(
              radius: 15,
              backgroundColor: entity.color,
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
