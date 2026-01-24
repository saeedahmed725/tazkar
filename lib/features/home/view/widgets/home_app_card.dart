import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppCard extends StatelessWidget {
  const HomeAppCard({super.key, required this.child, this.icon, this.title});

  final Widget child;
  final String? title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: context.secondary.withValues(alpha: 0.5),
            width: 1,
          ),
          color: context.primaryColor,
        ),
        child: (title == null && icon == null)
            ? child
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      if (icon != null)
                        SvgPicture.asset(
                          icon!,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            context.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      if (title != null)
                        Text(
                          title!,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                    ],
                  ),
                  Divider(height: 16, color: Colors.white38),
                  child,
                ],
              ),
      ),
    );
  }
}
