import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/shared/loading_widget.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/features/quran/views/bloc/juz_infos/juz_infos_bloc.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/juz_list/juz_card_list_view.dart';

class JuzListViewCardsBuilder extends StatefulWidget {
  const JuzListViewCardsBuilder({super.key});

  @override
  State<JuzListViewCardsBuilder> createState() =>
      _JuzListViewCardsBuilderState();
}

class _JuzListViewCardsBuilderState extends State<JuzListViewCardsBuilder> {
  @override
  void initState() {
    context.read<JuzInfosBloc>().add(GetJuzInfos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JuzInfosBloc, JuzInfosState>(
      builder: (context, state) {
        if (state is JuzInfosLoading) {
          return LoadingWidget();
        } else if (state is JuzInfosError) {
          return AppFailureWidget(failure: state.failure);
        } else if (state is JuzInfosLoaded) {
          return JuzCardListView(juzInfos: state.juzInfos);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
