import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sheets extends StatefulWidget {
  const Sheets({
    super.key,
    this.children = const [],
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
  });

  final List<Widget> children;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;

  @override
  State<Sheets> createState() => _SheetsState();

  static PersistentBottomSheetController show(
    BuildContext context, {
    required Widget child,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
  }) {
    isBottomSheetOpen.value = true;
    final result = _SheetsState().showAppBottomSheet(
      context,
      child: child,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      backgroundColor: backgroundColor,
    );
    isBottomSheetOpen.value = false;
    return result;
  }

  static void toggleBottomSheet({bool? isOpen}) {
    isBottomSheetOpen.value = isOpen ?? !isBottomSheetOpen.value;
  }

  static void close(BuildContext context, [Object? result]) {
    GoRouter.of(context).pop(result);
  }

  static ValueNotifier<bool> isBottomSheetOpen = ValueNotifier(false);

  static final _sheet = GlobalKey();

  static DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  static Future<T?> showModel<T>(
    BuildContext context, {
    required Widget child,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? backgroundColor,
    bool showDragHandle = true,
    double? elevation,
    Color? barrierColor,
    bool enableDrag = true,
    BoxConstraints? constraints,
    bool isDismissible = true,
    bool useSafeArea = true,
    bool isScrollControlled = false,
    bool showCupertino = false,
    bool useNestedNavigation = false,
  }) {
    isBottomSheetOpen.value = true;
    return _SheetsState()
        .showAppModelBottomSheet<T>(
          context,
          child: child,
          shape: shape,
          clipBehavior: clipBehavior,
          backgroundColor: backgroundColor,
          showDragHandle: showDragHandle,
          elevation: elevation,
          barrierColor: barrierColor,
          enableDrag: enableDrag,
          constraints: constraints,
          isDismissible: isDismissible,
          useSafeArea: useSafeArea,
          isScrollControlled: isScrollControlled,
          showCupertino: showCupertino,
          useNestedNavigation: useNestedNavigation,
        )
        .whenComplete(() => isBottomSheetOpen.value = false);
  }
}

class _SheetsState extends State<Sheets> {
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => _animateSheet(Sheets.sheet.snapSizes!.first);

  void expand() => _animateSheet(Sheets.sheet.maxChildSize);

  void hide() => _animateSheet(0);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: Sheets._sheet,
      initialChildSize: widget.initialChildSize ?? 0.35,
      maxChildSize: widget.maxChildSize ?? 1,
      minChildSize: widget.minChildSize ?? 0.1,
      expand: false,
      snap: true,
      snapSizes: [widget.minChildSize ?? 0.35, widget.maxChildSize ?? 1.0],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          children: widget.children,
        );
      },
    );
  }

  PersistentBottomSheetController showAppBottomSheet(
    BuildContext context, {
    required Widget child,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
  }) {
    return Scaffold.of(context).showBottomSheet(
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 400),
      ),
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ),
      (context) => child,
    );
  }

  ///[showAppBottomSheet]
  Future<T?> showAppModelBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? backgroundColor,
    bool showDragHandle = true,
    double? elevation,
    Color? barrierColor,
    bool enableDrag = true,
    BoxConstraints? constraints,
    bool isDismissible = true,
    bool useSafeArea = true,
    bool isScrollControlled = false,
    bool showCupertino = false,
    bool useNestedNavigation = false,
  }) {
    if (showCupertino) {
      return showCupertinoSheet<T>(
        context: context,
        enableDrag: enableDrag,
        useNestedNavigation: useNestedNavigation,
        builder: (context) {
          return Material(child: child);
        },
      );
    }

    return showModalBottomSheet<T>(
      context: context,
      shape: shape,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      clipBehavior: clipBehavior,
      elevation: elevation,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 400),
      ),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return child;
      },
    );
  }
}
