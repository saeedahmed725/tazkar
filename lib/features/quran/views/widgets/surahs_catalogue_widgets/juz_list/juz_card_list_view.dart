import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/juz_list/juz_card_view.dart';

import '../../../../../../core/locator/locator.dart';
import '../../../../../../core/quran/global_quran_data.dart';

class JuzCardListView extends StatelessWidget {
  const JuzCardListView({super.key, required this.juzInfos});

  final List<JuzModel> juzInfos;

  @override
  Widget build(BuildContext context) {
    final quran = ServiceLocator.get<GlobalQuranData>().quranText;
    return ListView.separated(
      itemCount: juzInfos.length,
      padding: EdgeInsets.all(14),
      itemBuilder: (context, index) =>
          JuzCardView(juzInfos: juzInfos, quran: quran, index: index),
      separatorBuilder: (context, index) =>
          Divider(color: context.primaryColor.withValues(alpha: 0.3)),
    );
  }
}
