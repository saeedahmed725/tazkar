import 'dart:core';
import 'dart:developer';

import 'package:tazkar/features/quran/data/model/quran_data_model.dart';

import '../locator/locator.dart';
import 'global_quran_data.dart';
import 'juz_data.dart';
import 'page_data.dart';
import 'sajdah_verses.dart';
import 'surah_data.dart';

class Quran {
  static final Quran instance = Quran._();

  Quran._() {
    quranText = ServiceLocator.get<GlobalQuranData>().quranText;
  }

  List<QuranModel> quranText = [];

  List<int> topOfThePageIndex = [
    76,
    207,
    331,
    341,
    349,
    366,
    376,
    414,
    417,
    435,
    445,
    452,
    498,
    506,
    525,
    548,
    554,
    555,
    557,
    583,
    584,
  ];

  List<int> downThePageIndex = [
    75,
    206,
    330,
    340,
    348,
    365,
    375,
    413,
    416,
    434,
    444,
    451,
    497,
    505,
    524,
    547,
    554,
    556,
    583,
  ];

  List juzNames = [
    "ٱلْجُزْءُ ٱلْأَوَّلُ",
    "ٱلْجُزْءُ ٱلثَّانِي",
    "ٱلْجُزْءُ ٱلثَّالِثُ",
    "ٱلْجُزْءُ ٱلرَّابِعُ",
    "ٱلْجُزْءُ ٱلْخَامِسُ",
    "ٱلْجُزْءُ ٱلسَّادِسُ",
    "ٱلْجُزْءُ ٱلسَّابِعُ",
    "ٱلْجُزْءُ ٱلثَّامِنُ",
    "ٱلْجُزْءُ ٱلتَّاسِعُ",
    "ٱلْجُزْءُ ٱلْعَاشِرُ",
    "ٱلْجُزْءُ ٱلْحَادِي عَشَرَ",
    "ٱلْجُزْءُ ٱلثَّانِي عَشَرَ",
    "ٱلْجُزْءُ ٱلثَّالِثُ عَشَرَ",
    "ٱلْجُزْءُ ٱلرَّابِعُ عَشَرَ",
    "ٱلْجُزْءُ ٱلْخَامِسُ عَشَرَ",
    "ٱلْجُزْءُ ٱلسَّادِسُ عَشَرَ",
    "ٱلْجُزْءُ ٱلسَّابِعُ عَشَرَ",
    "ٱلْجُزْءُ ٱلثَّامِنُ عَشَرَ",
    "ٱلْجُزْءُ ٱلتَّاسِعُ عَشَرَ",
    "ٱلْجُزْءُ ٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلْوَاحِدُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلثَّانِي وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلثَّالِثُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلرَّابِعُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلْخَامِسُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلسَّادِسُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلسَّابِعُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلثَّامِنُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلتَّاسِعُ وَٱلْعِشْرُونَ",
    "ٱلْجُزْءُ ٱلثَّلَاثُونَ",
  ];

  List getPageData(int pageNumber) {
    if (pageNumber < 1 || pageNumber > 604) {
      throw "Invalid page number. Page number must be between 1 and 604";
    }
    return pageData[pageNumber - 1];
  }

  List<int> surahAyahCounts = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    8,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    7,
    3,
    6,
    3,
    5,
    4,
    5,
    6,
  ];

  ///The most standard and common copy of Arabic only Quran total pages count
  final int totalPagesCount = 604;

  ///The constant total of makki surahs
  final int totalMakkiSurahs = 89;

  ///The constant total of madani surahs
  final int totalMadaniSurahs = 25;

  ///The constant total juz count
  final int totalJuzCount = 30;

  ///The constant total surah count
  final int totalSurahCount = 114;

  ///The constant total verse count
  final int totalVerseCount = 6236;

  ///The constant 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'
  final String basmala = "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏";

  ///The constant 'سَجْدَةٌ'
  final String sajdah = "سَجْدَةٌ";

  // QuranModel searchByVerseNumber(String verse) {
  //   return quranText
  //       .firstWhere((element) => verse.contains(element.textTashkil));
  // }

  /// [surahNumber] is the number of the surah (1-114) and returns the total number of ayahs in that surah
  int getSurahAyaCount(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }
    return surahAyahCounts[surahNumber - 1];
  }

  int getSurahCountByPage(int pageNumber) {
    if (pageNumber < 1 || pageNumber > 604) {
      throw "Invalid page number. Page number must be between 1 and 604";
    }
    return pageData[pageNumber - 1].length;
  }

  int getVerseCountByPage(int pageNumber) {
    if (pageNumber < 1 || pageNumber > 604) {
      throw "Invalid page number. Page number must be between 1 and 604";
    }
    int totalVerseCount = 0;
    for (int i = 0; i < pageData[pageNumber - 1].length; i++) {
      totalVerseCount += int.parse(
        pageData[pageNumber - 1][i]!["end"].toString(),
      );
    }
    return totalVerseCount;
  }

  int getJuzNumber(int surahNumber, int verseNumber) {
    for (var juz in juz) {
      if (juz["verses"].keys.contains(surahNumber)) {
        if (verseNumber >= juz["verses"][surahNumber][0] &&
            verseNumber <= juz["verses"][surahNumber][1]) {
          log(
            "Juz found for given surahNumber and verseNumber ${int.parse(juz["id"].toString())}",
          );
          return int.parse(juz["id"].toString());
        }
      }
    }
    return -1;
  }

  int getJuzForAyah(int surahNumber, int verseNumber) {
    for (var juz in juz) {
      if (juz["verses"].keys.contains(surahNumber)) {
        if (verseNumber == juz["verses"][surahNumber][0]) {
          log(
            "Juz found for given surahNumber and verseNumber ${int.parse(juz["id"].toString())}",
          );
          return int.parse(juz["id"].toString());
        }
      }
    }
    return -1;
  }

  Map<int, List<int>> getSurahAndVersesFromJuz(int juzNumber) {
    return juz[juzNumber - 1]["verses"];
  }

  String getSurahName(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }
    return surah[surahNumber - 1]['name'].toString();
  }

  ///Takes [surahNumber] returns the Surah name in English
  String getSurahNameEnglish(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }
    return surah[surahNumber - 1]['english'].toString();
  }

  ///Takes [surahNumber] returns the Surah name in Turkish
  String getSurahNameTurkish(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }
    return surah[surahNumber - 1]['turkish'].toString();
  }

  ///Takes [surahNumber] returns the Surah name in Arabic
  String getSurahNameArabic(int surahNumber) {
    try {
      if (surahNumber > 114 || surahNumber <= 0) {
        throw "No Surah found with given surahNumber";
      }
      return surah[surahNumber - 1]['arabic'].toString();
    } catch (e) {
      throw "No Surah found with given surahNumber";
    }
  }

  ///Takes [page] returns the Surah name in Arabic
  List<String> getSurahNamesArabicByPage(int page) {
    try {
      if (page > 604 || page <= 0) {
        throw "No Surah found with given page";
      }
      List<String> pageSurahNames = [];
      final pageData = getPageData(page);
      for (var surah in pageData) {
        pageSurahNames.add(getSurahNameArabic(surah['surah']));
      }
      return pageSurahNames;
    } catch (e) {
      throw "No Surah found with given surahNumber";
    }
  }

  ///Takes [surahNumber], [verseNumber] and returns the page number of the Quran
  int getPageNumber(int surahNumber, int verseNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }

    for (int pageIndex = 0; pageIndex < pageData.length; pageIndex++) {
      for (
        int surahIndexInPage = 0;
        surahIndexInPage < pageData[pageIndex].length;
        surahIndexInPage++
      ) {
        final e = pageData[pageIndex][surahIndexInPage];
        if (e['surah'] == surahNumber &&
            e['start'] <= verseNumber &&
            e['end'] >= verseNumber) {
          return pageIndex + 1;
        }
      }
    }

    throw "Invalid verse number.";
  }

  ///Takes [surahNumber] and returns the place of revelation (Makkah / Madinah) of the surah
  String getPlaceOfRevelation(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No Surah found with given surahNumber";
    }
    return surah[surahNumber - 1]['place'].toString();
  }

  ///Takes [surahNumber] and returns the count of total Verses in the Surah
  int getVerseCount(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "No verse found with given surahNumber";
    }
    return int.parse(surah[surahNumber - 1]['aya'].toString());
  }

  int getAyahId(int surahNumber, int ayahNumber) {
    // Calculate the total number of verses in all previous surahs
    int totalVerses = 0;
    for (int i = 0; i < surahNumber - 1; i++) {
      totalVerses += getVerseCount(i + 1);
    }

    // Calculate the ayah ID
    int ayahId = totalVerses + ayahNumber;

    return ayahId;
  }

  ///Takes [surahNumber], [verseNumber] & [verseEndSymbol] (optional) and returns the Verse in Arabic
  String getVerse(
    int surahNumber,
    int verseNumber, {
    bool verseEndSymbol = false,
    List<QuranModel>? quran,
  }) {
    String verse = "";
    for (var i in (quran ?? quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        verse = i.ayaDiac.toString();
        break;
      }
    }

    if (verse == "") {
      throw "No verse found with given surahNumber and verseNumber.\n\n";
    }

    return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : "");
  }

  ///Takes [surahNumber], [verseNumber] & [verseEndSymbol] (optional) and returns the Verse in Arabic
  String getClearVerse(
    int surahNumber,
    int verseNumber, {
    bool verseEndSymbol = false,
    List<QuranModel>? quran,
  }) {
    String verse = "";
    for (var i in (quran ?? quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        verse = i.searchText.toString();
        break;
      }
    }

    if (verse == "") {
      throw "No verse found with given surahNumber and verseNumber.\n\n";
    }

    return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : "");
  }

  String getVerseWithTashkil(
    int surahNumber,
    int verseNumber, {
    bool verseEndSymbol = false,
    List<QuranModel>? quran,
  }) {
    String verse = "";
    for (var i in (quran ?? quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        verse = i.ayaDiac.toString();
        break;
      }
    }

    if (verse == "") {
      throw "No verse found with given surahNumber and verseNumber.\n\n";
    }

    return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : "");
  }

  ({int page, String text}) getVerseTextWithPage(
    int surahNumber,
    int verseNumber,
  ) {
    int page = 0;
    String verse = "";

    for (var i in (quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        page = i.pageNum - 1;
        verse = i.ayaDiac;
        break;
      }
    }

    if (page == 0 && verse == "") {
      throw "No verse and page found with given surahNumber and verseNumber.\n\n";
    }
    return (text: verse, page: page);
  }

  String getVerseUniCode(
    int surahNumber,
    int verseNumber, {
    bool verseEndSymbol = false,
  }) {
    String verse = "";
    for (var i in (quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        verse = i.ayaDiac;
        break;
      }
    }

    if (verse == "") {
      throw "No verse found with given surahNumber and verseNumber.\n\n";
    }

    return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : "");
  }

  ///Takes [juzNumber] and returns Juz URL (from Quran.com)
  String getJuzURL(int juzNumber) {
    return "https://quran.com/juz/$juzNumber";
  }

  ///Takes [surahNumber] and returns Surah URL (from Quran.com)
  String getSurahURL(int surahNumber) {
    return "https://quran.com/$surahNumber";
  }

  ///Takes [surahNumber] & [verseNumber] and returns Verse URL (from Quran.com)
  String getVerseURL(int surahNumber, int verseNumber) {
    return "https://quran.com/$surahNumber/$verseNumber";
  }

  ///Takes [verseNumber], [arabicNumeral] (optional) and returns '۝' symbol with verse number
  String getVerseEndSymbol(int verseNumber, {bool arabicNumeral = true}) {
    var arabicNumeric = '';
    var digits = verseNumber.toString().split("").toList();

    if (!arabicNumeral) return '\u06dd${verseNumber.toString()}';

    const Map arabicNumbers = {
      "0": "٠",
      "1": "۱",
      "2": "۲",
      "3": "۳",
      "4": "٤",
      "5": "٥",
      "6": "٦",
      "7": "۷",
      "8": "۸",
      "9": "۹",
    };

    for (var e in digits) {
      arabicNumeric += arabicNumbers[e];
    }

    return '\uFD3E$arabicNumeric\uFD3F';
  }

  ///Takes [surahNumber] and returns the list of page numbers of the surah
  List<int> getSurahPages(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "Invalid surahNumber";
    }

    final pagesCount = totalPagesCount;
    List<int> pages = [];
    for (int currentPage = 1; currentPage <= pagesCount; currentPage++) {
      final pageData = getPageData(currentPage);
      for (int j = 0; j < pageData.length; j++) {
        final currentSurahNum = pageData[j]['surah'];
        if (currentSurahNum == surahNumber) {
          pages.add(currentPage);
          break;
        }
      }
    }
    return pages;
  }

  ///Takes [surahNumber] and returns audio URL of that surah
  String getAudioURLBySurah(int surahNumber) {
    return "https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/$surahNumber.mp3";
  }

  ///Takes [surahNumber] & [verseNumber] and returns audio URL of that verse
  String getAudioURLByVerse(int surahNumber, int verseNumber) {
    int verseNum = 0;
    for (var i in (quranText)) {
      if (i.soraNum == surahNumber && i.ayaNum == verseNumber) {
        verseNum = (quranText).indexOf(i) + 1;
        break;
      }
    }
    return "https://cdn.islamic.network/quran/audio/128/ar.alafasy/$verseNum.mp3";
  }

  String formatNumberWithLeadingZeros(int number, int totalDigits) {
    String numberStr = number.toString();
    int zerosToAdd = totalDigits - numberStr.length;
    String formattedNumber = '0' * zerosToAdd + numberStr;
    return formattedNumber;
  }

  ///Takes [surahNumber] & [verseNumber] and returns true if verse is sajdah
  bool isSajdahVerse(int surahNumber, int verseNumber) =>
      sajdahVerses[surahNumber] == verseNumber;

  ///Takes [verseNumber] and returns audio URL of that verse
  String getAudioURLByVerseNumber(int verseNumber) {
    return "https://cdn.islamic.network/quran/audio/128/ar.alafasy/$verseNumber.mp3";
  }
}

enum Translation { enSaheeh, trSaheeh, mlAbdulHameed }

enum SurahSeperator {
  none,
  surahName,
  surahNameArabic,
  surahNameEnglish,
  surahNameTurkish,
}
