import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class PreferencesItem {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final IconData icon;
  final GestureTapCallback? onTap;

  PreferencesItem({
    this.onTap,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.icon,
  });
}

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key, required this.title, required this.items});

  final String title;
  final List<PreferencesItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: context.theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (int index = 0; index < items.length; index++)
          ListTile(
            onTap: items[index].onTap,
            tileColor: context.colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                top: Radius.circular(index == 0 ? 14 : 6),
                bottom: Radius.circular(index == items.length - 1 ? 14 : 6),
              ),
            ),
            title: Text(
              items[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: items[index].subtitle != null
                ? Text(
                    items[index].subtitle!,
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                : null,
            trailing: items[index].trailing,
            leading: Icon(items[index].icon, color: context.primaryColor),
          ),
      ],
    );
  }
}
