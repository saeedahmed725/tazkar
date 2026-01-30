import 'package:flutter/material.dart';

class TransitionSwitcher extends StatelessWidget {
  const TransitionSwitcher({
    super.key,
    this.duration,
    this.child,
    this.beginOffset,
    this.endOffset,
  });

  final Duration? duration;

  final Widget? child;

  final Offset? beginOffset;
  final Offset? endOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: beginOffset ?? const Offset(0.3, 0),
              end: endOffset ?? Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: child,
    );
  }
}
