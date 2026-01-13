class SurahVerseEntity {
  final String type;
  final String name;
  final List arVerse;
  final List enVerse;
  final int count;
  final int id;

  SurahVerseEntity(
      {required this.arVerse,
      required this.enVerse,
      required this.count,
      required this.name,
      required this.type,
      required this.id});
}
