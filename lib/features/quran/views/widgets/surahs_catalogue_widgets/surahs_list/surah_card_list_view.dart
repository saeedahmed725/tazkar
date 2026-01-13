import 'package:flutter/material.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/constants/app_color.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/surahs_list/surah_card_view.dart';

class SurahCardListVIew extends StatelessWidget {
  const SurahCardListVIew({
    super.key,
    required this.surahInfos,
  });

  final List<SurahModel> surahInfos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: surahInfos.length,
      padding: EdgeInsets.all(14),
      separatorBuilder: (context, index) =>
          Divider(color: AppColor.kPrimaryColor.withOpacity(0.3)),
      itemBuilder: (context, index) => SurahCardView(
        arName: surahInfos[index].name,
        enName: surahInfos[index].nameEn,
        ayahLength: surahInfos[index].ayatCount.toString(),
        surahId: surahInfos[index].id,
        surahType: surahInfos[index].type,
        onTap: () => context.toNamed(
          AppRoutes.quran,
          arguments: {"pageNumber": surahInfos[index].pageNum},
        ),
      ),
    );
  }
}
