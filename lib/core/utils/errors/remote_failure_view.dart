import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tazkar/core/utils/errors/failure.dart';

class RemoteFailureContent extends StatelessWidget {
  const RemoteFailureContent(this.failure, {super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.errorCode == NetworkFailure.INTERNET_ERROR_CODE) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: ClipOval(
                child: LottieBuilder.asset(
                  'assets/images/error/no_internet.json',
                ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: LottieBuilder.asset('assets/images/error/general_error.json'),
        ),
        SizedBox(height: 16),
        Text(
          failure.message,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
