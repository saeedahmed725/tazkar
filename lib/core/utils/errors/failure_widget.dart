import 'package:flutter/material.dart';
import 'package:tazkar/core/shared/arabic_responsive_text.dart';
import 'package:tazkar/core/utils/errors/local_failure_view.dart';
import 'package:tazkar/core/utils/errors/remote_failure_view.dart';

import 'failure.dart';

class AppFailureWidget extends StatelessWidget {
  const AppFailureWidget({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.type == FailureType.local) {
      return LocalFailureContent(failure);
    }
    if (failure.type == FailureType.network ||
        failure.type == FailureType.internal) {
      return RemoteFailureContent(failure);
    }

    return Center(
      child: ArabicResponsiveText(text: failure.message, fontSize: 18),
    );
  }
}
