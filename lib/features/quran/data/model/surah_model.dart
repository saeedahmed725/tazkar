class SurahModel {
  final int id;
  final String name;
  final int ayatCount;
  final int pageNum;
  final int type;
  final String searchText;
  final String nameAr;
  final String nameEn;
  final int startAya;
  final int endAya;

  SurahModel({
    required this.id,
    required this.name,
    required this.ayatCount,
    required this.pageNum,
    required this.type,
    required this.searchText,
    required this.nameAr,
    required this.nameEn,
    required this.startAya,
    required this.endAya,
  });

  // Factory method to create a Surah from a JSON object
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      id: json['Id'],
      name: json['Name'],
      ayatCount: json['AyatCount'],
      pageNum: json['PageNum'],
      type: json['Type'],
      searchText: json['SearchText'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      startAya: json['start_aya'],
      endAya: json['end_aya'],
    );
  }

  // Method to convert Surah to JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'AyatCount': ayatCount,
      'PageNum': pageNum,
      'Type': type,
      'SearchText': searchText,
      'name_ar': nameAr,
      'name_en': nameEn,
      'start_aya': startAya,
      'end_aya': endAya,
    };
  }
}
