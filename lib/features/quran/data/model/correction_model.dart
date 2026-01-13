class CorrectionModel {
  final List<CorrectionWordsModel> words;
  final int surahNumber;
  final int ayahNumber;
  final int pageNumber;

  CorrectionModel({
    required this.words,
    required this.surahNumber,
    required this.ayahNumber,
    required this.pageNumber,
  });

  factory CorrectionModel.fromJson(Map<String, dynamic> json) {
    return CorrectionModel(
      words: (json['words'] as List)
          .map((e) => CorrectionWordsModel.fromJson(e))
          .toList(),
      surahNumber: json['surah_number'] as int,
      ayahNumber: json['ayah_number'] as int,
      pageNumber: json['page_number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'words': words,
      'surah_number': surahNumber,
      'ayah_number': ayahNumber,
    };
  }
}

class CorrectionWordsModel {
  final int correctionValue;
  final int wordNumber;

  CorrectionWordsModel({
    required this.correctionValue,
    required this.wordNumber,
  });

  factory CorrectionWordsModel.fromJson(Map<String, dynamic> json) {
    return CorrectionWordsModel(
      correctionValue: json['correction_value'] as int,
      wordNumber: json['word_number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'correction_value': correctionValue,
      'word_number': wordNumber,
    };
  }
}
