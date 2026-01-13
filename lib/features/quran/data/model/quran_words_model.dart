class QuranIrabWordsModel {
  final int surahNumber;
  final int ayahNumber;
  final int wordNumber;
  final String irab;

  QuranIrabWordsModel({
    required this.surahNumber,
    required this.ayahNumber,
    required this.wordNumber,
    required this.irab,
  });

  factory QuranIrabWordsModel.fromJson(Map<String, dynamic> json) {
    return QuranIrabWordsModel(
      surahNumber: json['surahNo'],
      ayahNumber: json['ayahNo'],
      wordNumber: json['wordNo'],
      irab: json['irabMushakkal'],
    );
  }
}

class QuranRasmWordsModel {
  final int surahNumber;
  final int ayahNumber;
  final int wordNumber;
  final String word;
  final String rasm;

  QuranRasmWordsModel({
    required this.surahNumber,
    required this.ayahNumber,
    required this.wordNumber,
    required this.word,
    required this.rasm,
  });

  factory QuranRasmWordsModel.fromJson(Map<String, dynamic> json) {
    return QuranRasmWordsModel(
      surahNumber: json['surahNo'],
      ayahNumber: json['ayahNo'],
      wordNumber: json['wordNo'],
      word: json['word'],
      rasm: json['rasm'],
    );
  }
}

class QuranMeaningWordsModel {
  final int surahNumber;
  final int ayahNumber;
  final int wordNumber;

  final String meaning;

  QuranMeaningWordsModel({
    required this.surahNumber,
    required this.ayahNumber,
    required this.wordNumber,
    required this.meaning,
  });

  factory QuranMeaningWordsModel.fromJson(Map<String, dynamic> json) {
    return QuranMeaningWordsModel(
      surahNumber: json['surahNo'],
      ayahNumber: json['ayahNo'],
      wordNumber: json['wordNo'],
      meaning: json['meaning'],
    );
  }
}

class QuranSarfWordsModel {
  final int surahNumber;
  final int ayahNumber;
  final int wordNumber;

  final String sarf;

  QuranSarfWordsModel(
      {required this.surahNumber,
      required this.ayahNumber,
      required this.wordNumber,
      required this.sarf});

  factory QuranSarfWordsModel.fromJson(Map<String, dynamic> json) {
    return QuranSarfWordsModel(
      surahNumber: json['surahNo'],
      ayahNumber: json['ayahNo'],
      wordNumber: json['wordNo'],
      sarf: json['sarf'],
    );
  }
}

