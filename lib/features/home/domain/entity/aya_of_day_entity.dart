class AyaOfDayEntity {
  final String ref;
  final String ayahNo;
  final String surahNo;
  final String subTitle;
  final String date;

  AyaOfDayEntity({
    required this.ref,
    required this.subTitle,
    required this.ayahNo,
    required this.surahNo,
    String? date,
  }) : date = date ?? DateTime.now().toIso8601String();

  Map<String, dynamic> toJson() {
    return {
      'ref': ref,
      'subTitle': subTitle,
      'ayahNo': ayahNo,
      'surahNo': surahNo,
      'date': date,
    };
  }

  factory AyaOfDayEntity.fromJson(Map<String, dynamic> json) {
    return AyaOfDayEntity(
      ref: json['ref'] ?? '',
      ayahNo: json['ayahNo'] ?? '',
      surahNo: json['surahNo'] ?? '',
      subTitle: json['subTitle'] ?? '',
      date: json['date'],
    );
  }
}
