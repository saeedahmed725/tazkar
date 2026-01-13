import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500.w),
                child:
                    LottieBuilder.asset('assets/images/core/json/all_set.json'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Database downloaded!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Before using \'Quran Memorization App\', '
                'we need to ask for your permission to use your phone services.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
