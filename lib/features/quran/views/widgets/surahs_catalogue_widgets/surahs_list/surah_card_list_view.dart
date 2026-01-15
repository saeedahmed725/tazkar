import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/features/quran/data/model/surah_model.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/surahs_list/surah_card_view.dart';

import '../../../../../../core/constants/app_colors.dart';

class SurahCardListVIew extends StatelessWidget {
  const SurahCardListVIew({super.key, required this.surahInfos});

  final List<SurahModel> surahInfos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: surahInfos.length,
      padding: EdgeInsets.all(14),
      separatorBuilder: (context, index) =>
          Divider(color: AppColors.primary.withValues(alpha: 0.3)),
      itemBuilder: (context, index) => SurahCardView(
        arName: surahInfos[index].name,
        enName: surahInfos[index].nameEn,
        ayahLength: surahInfos[index].ayatCount.toString(),
        surahId: surahInfos[index].id,
        surahType: surahInfos[index].type,
        onTap: () => GoRouter.of(context).pushNamed(
          AppRoutes.quran,
          queryParameters: {
            "page_number": surahInfos[index].pageNum.toString(),
          },
        ),
      ),
    );
  }
}
