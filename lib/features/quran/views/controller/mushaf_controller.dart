import 'package:flutter/material.dart';
import 'package:tazkar/core/quran/quran.dart';
import 'package:tazkar/features/quran/data/model/ayah_glyph.dart';

class MushafController {
  MushafController._internal();

  static MushafController instance = MushafController._internal();

  PageController pageController = PageController();

  int get currentPageNumber {
    return (pageController.page?.toInt() ?? 0) + 1;
  }

  void goToPage(int pageIndex) {
    pageController.jumpToPage(pageIndex - 1);
  }

  String getJuzName(AyahGlyph glyphs) {
    return Quran.instance.juzNames[Quran.instance
            .getJuzNumber(glyphs.surahNumber, int.parse(glyphs.ayahNumber!)) -
        1];
  }

  List<String> getPageSurahNames(int pageNumber) {
    return Quran.instance.getSurahNamesArabicByPage(pageNumber + 1);
  }

  bool isLeftPage(int currentPageIndex) {
    bool isLeft = true;
    if ((currentPageIndex + 1) % 2 == 0) {
      isLeft = true;
    } else {
      isLeft = false;
    }
    return isLeft;
  }
}

//  bool isFirst = true;
// Future<void> jumpToAya(int surahNumber, int ayaNumber) async {
//   log("surahNumber: $surahNumber ayaNumber: $ayaNumber  surahPages$surahPages",
//       name: "jumpToAya");
//   if (fabIsClicked || ayaFromJuzIsClicked) {
//     for (int surahPage in surahPages) {
//       Quran.instance
//           .getVersesTextByPage(pageNumber: surahPage)
//           .forEach((ayahs) async {
//         for (var ayah in ayahs) {
//           if (ayah.surahNumber == surahNumber &&
//               ayah.ayahNumber == ayaNumber) {
//             pageController.jumpToPage(surahPage - 1);
//           }
//         }
//       });
//     }
//   }
// }

// void getSurahPosition() async {
//   if (isFirst) {
//     int surahPageNumber = (surahPages[0] - 1);
//     pageController.jumpToPage(surahPageNumber);
//     isFirst = false;
//     debugPrint("surahPages $surahPageNumber");
//   }
// }

// @override
// Future<void> onInit() async {
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   WidgetsBinding.instance.addPostFrameCallback((_) async {
//     getSurahPosition();
//     jumpToAya(surahIndex, ayaIndex);
//   });
// }

// @override
// void onClose() {
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//       overlays: SystemUiOverlay.values);
//   goToSurahListenPage();
//   super.onClose();
// }
