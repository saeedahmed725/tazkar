import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:tazkar/core/utils/errors/failure.dart';

class LocalFailureContent extends StatelessWidget {
  const LocalFailureContent(this.failure, {super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.errorCode == LocalFailure.LOCATION_SETTINGS_ERROR_CODE ||
        failure.errorCode == LocalFailure.LOCATION_PERMISSION_ERROR_CODE) {
      return Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.width * 0.6),
                child: LottieBuilder.asset('assets/images/error/no_gps.json'),
              ),
              SizedBox(height: 16),
              Text(
                failure.message,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  if (failure.errorCode ==
                      LocalFailure.LOCATION_PERMISSION_ERROR_CODE) {
                    await Geolocator.openAppSettings();
                    return;
                  }
                  await Geolocator.openLocationSettings();
                },
                child: Text(
                  failure.errorCode ==
                          LocalFailure.LOCATION_PERMISSION_ERROR_CODE
                      ? 'Open App Settings'
                      : 'Open Location Settings',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (failure.errorCode == LocalFailure.DATABASE_ERROR_CODE) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.6),
              child: LottieBuilder.asset(
                'assets/images/error/database_error.json',
              ),
            ),
            SizedBox(height: 16),
            Text(
              failure.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width * 0.6),
            child: LottieBuilder.asset(
              'assets/images/error/general_error.json',
            ),
          ),
          SizedBox(height: 16),
          Text(
            failure.message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
