import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/core/shared/loading_widget.dart';
import 'package:tazkar/core/utils/errors/failure_widget.dart';
import 'package:tazkar/features/quran/views/bloc/surah_infos/surah_infos_bloc.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/surahs_list/surah_card_list_view.dart';

class SurahListViewCardBuilder extends StatefulWidget {
  const SurahListViewCardBuilder({super.key});

  @override
  State<SurahListViewCardBuilder> createState() => _SurahListViewCardBuilderState();
}

class _SurahListViewCardBuilderState extends State<SurahListViewCardBuilder> {
  @override
  void initState() {
    context.read<SurahInfosBloc>().add(GetSurahInfos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahInfosBloc, SurahInfosState>(
      builder: (context, state) {
        if (state is SurahInfosLoading) {
          return LoadingWidget();
        } else if (state is SurahInfosError) {
          return AppFailureWidget(failure: state.failure);
        } else if (state is SurahInfosLoaded) {
          return SurahCardListVIew(surahInfos: state.surahInfos);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
