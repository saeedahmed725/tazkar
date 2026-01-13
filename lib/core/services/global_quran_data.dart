import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';
import 'package:tazkar/features/quran/data/model/quran_data_model.dart';

class GlobalQuranData {
  GlobalQuranData._internal();

  static final GlobalQuranData instance = GlobalQuranData._internal();
  List<QuranModel> quranText = [];

  List<List<AyahGlyph>> ayahGlyphs = [];

  void setQuranText(List<QuranModel> quran) {
    quranText = quran;
  }

  void setAyahGlyphs(List<List<AyahGlyph>> glyphs) {
    ayahGlyphs = glyphs;
  }

  List<AyahGlyph> getAyahGlyphsForPage(int pageNumber) {
    return ayahGlyphs[pageNumber];
  }
}
