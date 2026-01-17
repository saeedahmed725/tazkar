import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/features/home/view/widgets/custom_bottom_nav_bar.dart';

class HomeShellView extends StatelessWidget {
  const HomeShellView({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(child: child),
    );
  }
}
