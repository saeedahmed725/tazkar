
import 'package:flutter/material.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/services/locator.dart';
import 'package:tazkar/features/quran/data/model/juz_model.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/juz_list/juz_card_view.dart';

class JuzCardListView extends StatelessWidget {
  const JuzCardListView({super.key, required this.juzInfos});

  final List<JuzModel> juzInfos;

  @override
  Widget build(BuildContext context) {
    final quran = ServiceLocator.globalQuranData.quranText;
    return ListView.separated(
      itemCount: juzInfos.length,
      padding: EdgeInsets.all(14),
      itemBuilder: (context, index) =>
          JuzCardView(juzInfos: juzInfos, quran: quran, index: index),
      separatorBuilder: (context, index) =>
          Divider(color: AppColor.kPrimaryColor.withOpacity(0.3)),
    );
  }
}
