import 'package:flutter/material.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';
import 'package:tazkar/features/home/view/widgets/prayer_tracker.dart';

import '../widgets/ayat_card.dart';
import '../widgets/home_bottom_layout_sliver_list.dart';
import '../widgets/home_top_layout_sliver_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollBehavior(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        slivers: [
          // HomeSliverAppBar(),
          // SliverToBoxAdapter(child: SizedBox(height: 12)),
          PrayerSliverCard(),
          HomeTopLayoutSliverList(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          HomeBottomLayoutSliverList(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          PrayerTracker(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          AyaDayCard(),
          SliverToBoxAdapter(child: SizedBox(height: 65)),
        ],
      ),
    );
  }
}
