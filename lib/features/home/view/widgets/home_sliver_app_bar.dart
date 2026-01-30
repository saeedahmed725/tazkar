import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/features/home/view/widgets/prayer_sliver_card.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.primaryColor,
      surfaceTintColor: context.primaryColor,
      expandedHeight: 250,
      pinned: true,
      floating: false,
      snap: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Align(
          alignment: Alignment.bottomCenter,
          child: PrayerSliverCard(),
        ),
      ),
      title: Text(
        "home".tr(),
        style: context.titleLarge?.copyWith(color: Colors.white),
      ),
      actions: [
        // Notification badge
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 4.0),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_on_sharp,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     // Avatar with glow effect
      //     CircleAvatar(
      //       radius: 22,
      //       backgroundColor: context.colorScheme.secondary.withValues(
      //         alpha: 0.3,
      //       ),
      //       child: Text(
      //         'س',
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //     SizedBox(width: 12),
      //     Expanded(
      //       child: Column(
      //         spacing: 2,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Text(
      //             'greetings'.tr(namedArgs: {'name': 'سعيد'}),
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
