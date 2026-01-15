import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'blur_background.dart';

enum ToastPosition { top, bottom }

enum ToastState { success, error, info, warning, loading }

class ModernToast {
  static OverlayEntry? _overlayEntry;
  static GlobalKey<ToastWidgetState>? _toastKey;

  static void show(
    BuildContext context, {
    required String message,
    String? title,
    ToastPosition position = ToastPosition.top,
    ToastState state = ToastState.info,
    Duration? duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    hide();

    _toastKey = GlobalKey<ToastWidgetState>();

    final toastWidget = ToastWidget(
      key: _toastKey,
      message: message,
      title: title,
      position: position,
      state: state,
      duration: duration,
      onTap: onTap,
      onDismiss: hide,
    );

    _overlayEntry = OverlayEntry(builder: (context) => toastWidget);

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void update({String? message, String? title, ToastState? state}) {
    _toastKey?.currentState?.updateToast(
      message: message,
      title: title,
      state: state,
    );
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _toastKey = null;
  }
}

class ToastWidget extends StatefulWidget {
  final String message;
  final String? title;
  final ToastPosition position;
  final ToastState state;
  final Duration? duration;
  final VoidCallback? onTap;
  final VoidCallback onDismiss;

  const ToastWidget({
    super.key,
    required this.message,
    this.title,
    required this.position,
    required this.state,
    this.duration,
    this.onTap,
    required this.onDismiss,
  });

  @override
  ToastWidgetState createState() => ToastWidgetState();
}

class ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  late String _message;
  String? _title;
  late ToastState _state;

  @override
  void initState() {
    super.initState();

    _message = widget.message;
    _title = widget.title;
    _state = widget.state;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: widget.position == ToastPosition.top ? -1.0 : 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _controller.forward();

    if (widget.duration != null) {
      Future.delayed(widget.duration!, () {
        if (!mounted) return;
        _dismiss();
      });
    }
  }

  void updateToast({String? message, String? title, ToastState? state}) {
    setState(() {
      if (message != null) _message = message;
      if (title != null) _title = title;
      if (state != null) _state = state;
    });
  }

  void _dismiss() async {
    await _controller.reverse();
    if (mounted) {
      ModernToast.hide();
    }
  }

  Color get _backgroundColor {
    switch (_state) {
      case ToastState.success:
        return AppColors.success;
      case ToastState.error:
        return AppColors.error;
      case ToastState.warning:
        return AppColors.warning;
      case ToastState.info:
        return AppColors.info;
      case ToastState.loading:
        return AppColors.primary;
    }
  }

  IconData get _icon {
    switch (_state) {
      case ToastState.success:
        return Icons.check_circle_outline;
      case ToastState.error:
        return Icons.error_outline;
      case ToastState.warning:
        return Icons.warning_amber_outlined;
      case ToastState.info:
        return Icons.info_outline;
      case ToastState.loading:
        return Icons.hourglass_bottom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: widget.position == ToastPosition.top ? 50 : null,
          bottom: widget.position == ToastPosition.bottom ? 50 : null,
          left: 16,
          right: 16,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value * 100),
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: widget.onTap,
                  onPanUpdate: (details) {
                    if (details.delta.dx.abs() > details.delta.dy.abs()) {
                      if (details.delta.dx.abs() > 5) {
                        _dismiss();
                      }
                    }
                  },
                  child: BlurBackground(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white54,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: _backgroundColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Icon(
                                    _icon,
                                    key: ValueKey(_icon),
                                    color: _backgroundColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_title != null)
                                      AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        child: Text(
                                          _title!,
                                          key: ValueKey(_title),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),

                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Text(
                                        _message,
                                        key: ValueKey(_message),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _title != null ? 12 : 14,
                                          fontWeight: _title != null
                                              ? FontWeight.w400
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: _dismiss,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
