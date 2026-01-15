import 'package:flutter/material.dart';

import '../utils/helpers/condition_helper.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.loading = false,
    this.onPressed,
    this.isWithBorder = false,
  }) : icon = null;

  const CustomElevatedButton.icon({
    super.key,
    required this.title,
    required this.icon,
    this.loading = false,
    this.onPressed,
    this.isWithBorder = false,
  });

  final Widget? icon;

  final String title;
  final bool loading;
  final bool isWithBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConditionHelper(
      height: 50,
      loading: loading,
      child: ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: isWithBorder
              ? Colors.transparent
              : theme.primaryColor,
          elevation: 6,
          shadowColor: isWithBorder
              ? Colors.transparent
              : theme.primaryColor.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            side: isWithBorder
                ? BorderSide(color: theme.primaryColor, width: 1.5)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(
                    title,
                    key: ValueKey(title),
                    style: TextStyle(
                      color: isWithBorder ? theme.primaryColor : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                key: ValueKey(title),
                style: TextStyle(
                  color: isWithBorder ? theme.primaryColor : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }
}
