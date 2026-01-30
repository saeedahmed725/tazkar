import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class CustomProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomProfileAppbar({super.key, required this.title, this.bottom});

  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                context.surface.withValues(alpha: 0.0),
                context.surface.withValues(alpha: 0.8),
                context.surface,
              ],
            ),
          ),
        ),
        // The actual AppBar
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: context.onSurface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          centerTitle: true,
          title: Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: bottom,
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight * 2 + (bottom?.preferredSize.height ?? 0));
}
