import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/features/download/view/bloc/download/download_bloc.dart';
import 'package:tazkar/features/download/view/bloc/percent/percent_bloc.dart';
import 'package:tazkar/features/download/view/widget/download_widget.dart';
import 'package:tazkar/features/download/view/widget/success_widget.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    BlocProvider.of<DownloadBloc>(context).add(CheckDatabaseZipFileIsExist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<DownloadBloc, DownloadState>(
          listener: (context, state) {

            final downloadBloc = BlocProvider.of<DownloadBloc>(context);

            if (state is DownloadDone) {
              downloadBloc.add(CheckDatabaseIsUnzipOrNot());
              BlocProvider.of<PercentBloc>(context).close();
            }
            if (state is CheckDatabaseExistDone) {
              if (state.isExist) {
                downloadBloc.add(CheckDatabaseIsUnzipOrNot());
              } else {
                downloadBloc.add(DownloadDatabase(context));
              }
            }
            if (state is CheckDatabaseDone) {
              context.toNamed(AppRoutes.splash);
              downloadBloc.close();
            }
            if (state is DownloadFailed) {
              context.showSnackBar(state.failure.message);
            }
          },
          builder: (context, state) {
            if (state is DownloadLoading) return DownloadWidget();
            if (state is DownloadDone) return SuccessWidget();
            if (state is DownloadFailed) {
              return AppFailureWidget(failure: state.failure);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
