class QuranModel {
  final int id;
  final int soraNum;
  final int ayaNum;
  final int pageNum;
  final String soraName;
  final String soraNameEn;
  final String ayaDiac;
  final String ayaNoDiac;
  final int partNum;
  final int signType;
  final String searchText;
  final String? transEn;

  QuranModel({
    required this.id,
    required this.soraNum,
    required this.ayaNum,
    required this.pageNum,
    required this.soraName,
    required this.soraNameEn,
    required this.ayaDiac,
    required this.ayaNoDiac,
    required this.partNum,
    required this.signType,
    required this.searchText,
    required this.transEn,
  });

  // Factory method to create a Quran instance from a map (e.g., from JSON)
  factory QuranModel.fromMap(Map<String, dynamic> map) {
    return QuranModel(
      id: map['ID'],
      soraNum: map['SoraNum'],
      ayaNum: map['AyaNum'],
      pageNum: map['PageNum'],
      soraName: map['SoraName'],
      soraNameEn: map['SoraName_en'],
      ayaDiac: map['AyaDiac'],
      ayaNoDiac: map['AyaNoDiac'],
      partNum: map['PartNum'],
      signType: map['sign_type'],
      searchText: map['search_text'],
      transEn: map['trans_en'],
    );
  }
}
