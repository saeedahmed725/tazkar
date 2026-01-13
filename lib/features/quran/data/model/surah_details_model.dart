class SurahDetailsModel {
  final String type;
  final String title;
  final String arabicTitle;
  final String englishTitle;
  final int count;
  final int page;
  final int index;

  SurahDetailsModel({
    required this.type,
    required this.title,
    required this.arabicTitle,
    required this.englishTitle,
    required this.count,
    required this.index,
    required this.page,
  });

  factory SurahDetailsModel.fromJson({required Map<String, dynamic> data}) {
    return SurahDetailsModel(
      type: data["type"],
      title: data["title"],
      arabicTitle: data["titleAr"],
      englishTitle: data["titleEn"],
      count: data["count"],
      index: int.parse(data['index']),
      page: int.parse(data['page']),
    );
  }
}

