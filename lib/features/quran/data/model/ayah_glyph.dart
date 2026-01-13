class AyahGlyph {
  final int id;
  String? wordId;
  final int glyphTypeId;
  String? code;
  String? ayahNumber;
  final int surahNumber;
  final int lineNumber;
  final int pageNumber;

  AyahGlyph(
      {required this.id,
      this.wordId,
      required this.glyphTypeId,
      this.code,
      this.ayahNumber,
      required this.surahNumber,
      required this.lineNumber,
      required this.pageNumber});

  factory AyahGlyph.fromMap(Map<String, dynamic> map) {
    return AyahGlyph(
      id: map['ID'],
      wordId: map['word_id'],
      glyphTypeId: map['glyph_type_id'],
      code: map['glyph_code'],
      ayahNumber: map['ayah_number'],
      surahNumber: map['sura_number'],
      lineNumber: map['line_number'],
      pageNumber: map['page_number'],
    );
  }
}
