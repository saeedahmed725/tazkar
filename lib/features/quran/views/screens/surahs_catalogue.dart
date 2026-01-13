import 'package:flutter/material.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/appbar_wiegets/custom_surahs_catalogue_appbar.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/juz_list/juz_list_view_cards_builder.dart';
import 'package:tazkar/features/quran/views/widgets/surahs_catalogue_widgets/surahs_list/surah_list_view_card_builder.dart';

class SurahsCatalogue extends StatelessWidget {
  const SurahsCatalogue({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomSurahsCatalogueAppBar(scrollController: scrollController),
          ],
          body: TabBarView(
            children: [
              SurahListViewCardBuilder(),
              JuzListViewCardsBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
