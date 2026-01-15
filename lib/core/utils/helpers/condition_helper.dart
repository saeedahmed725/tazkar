import 'package:flutter/material.dart';

class ConditionHelper extends StatelessWidget {
  const ConditionHelper({
    super.key,
    this.loading = false,
    required this.child,
    this.height,
  });

  final double? height;
  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: loading
          ? Container(
              height: height ?? 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          : SizedBox(
              height: height ?? 55,
              width: double.infinity,
              child: child,
            ),
    );
  }
}
