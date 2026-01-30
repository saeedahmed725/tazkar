import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/features/qiblah/view/bloc/qiblah_bloc.dart';

import '../widgets/qiblah_compass.dart';

class QiblahScreen extends StatelessWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QiblahBloc, QiblahState>(
      builder: (context, state) {
        if (state.status == QiblahStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == QiblahStatus.failure && state.failure != null) {
          return AppFailureWidget(
            failure: state.failure!,
            onRetry: () => context.read<QiblahBloc>().add(
              const QiblahRequested(shouldRequestPermission: true),
            ),
          );
        }

        if (state.status == QiblahStatus.ready) {
          return const QiblahCompass();
        }

        return Center(
          child: ElevatedButton(
            onPressed: () => context.read<QiblahBloc>().add(
              const QiblahRequested(shouldRequestPermission: true),
            ),
            child: const Text('Load Qiblah'),
          ),
        );
      },
    );
  }
}
