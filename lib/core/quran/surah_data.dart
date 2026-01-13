const List surah = [
  {
    "id": 1,
    "name": "Al Fatiha",
    "aya": 7,
    "english": "The Opening",
    "turkish": "Fâtiha",
    "place": "Makkah",
    "arabic": "سُورَةُ ٱلْفَاتِحَةِ"
  },
  {
    "id": 2,
    "name": "Al Baqarah",
    "aya": 286,
    "english": "The Cow",
    "turkish": "Bakara",
    "place": "Madinah",
    "arabic": "سُورَةُ البَقَرَةِ"
  },
  {
    "id": 3,
    "name": "Al Imran",
    "aya": 200,
    "english": "The Family of Imran",
    "turkish": "Âl-i İmrân",
    "place": "Madinah",
    "arabic": "سُورَةُ آلِ عِمۡرَانَ"
  },
  {
    "id": 4,
    "name": "An Nisa",
    "aya": 176,
    "english": "The Women",
    "turkish": "Nisâ",
    "place": "Madinah",
    "arabic": "سُورَةُ النِّسَاءِ"
  },
  {
    "id": 5,
    "name": "Al Ma'idah",
    "aya": 120,
    "english": "The Table",
    "turkish": "Mâide",
    "place": "Madinah",
    "arabic": "سُورَةُ المَائـِدَةِ"
  },
  {
    "id": 6,
    "name": "Al An'am",
    "aya": 165,
    "english": "The Cattle",
    "turkish": "En'âm",
    "place": "Makkah",
    "arabic": "سُورَةُ الأَنۡعَامِ"
  },
  {
    "id": 7,
    "name": "Al A'raf",
    "aya": 206,
    "english": "The Heights",
    "turkish": "A'râf",
    "place": "Makkah",
    "arabic": "سُورَةُ الأَعۡرَافِ"
  },
  {
    "id": 8,
    "name": "Al Anfal",
    "aya": 75,
    "english": "The Spoils of War",
    "turkish": "Enfâl",
    "place": "Madinah",
    "arabic": "سُورَةُ الأَنفَالِ"
  },
  {
    "id": 9,
    "name": "At Tawbah",
    "aya": 129,
    "english": "The Repentance",
    "turkish": "Tevbe",
    "place": "Madinah",
    "arabic": "سُورَةُ التَّوۡبَةِ"
  },
  {
    "id": 10,
    "name": "Al Yunus",
    "aya": 109,
    "english": "Jonah",
    "turkish": "Yûnus",
    "place": "Makkah",
    "arabic": "سُورَةُ يُونُسَ"
  },
  {
    "id": 11,
    "name": "Hud",
    "aya": 123,
    "english": "Hud",
    "turkish": "Hûd",
    "place": "Makkah",
    "arabic": "سُورَةُ هُودٍ"
  },
  {
    "id": 12,
    "name": "Yusuf",
    "aya": 111,
    "english": "Joseph",
    "turkish": "Yûsuf",
    "place": "Makkah",
    "arabic": "سُورَةُ يُوسُفَ"
  },
  {
    "id": 13,
    "name": "Ar Ra'd",
    "aya": 43,
    "english": "The Thunder",
    "turkish": "Ra'd",
    "place": "Madinah",
    "arabic": "سُورَةُ الرَّعۡدِ"
  },
  {
    "id": 14,
    "name": "Ibrahim",
    "aya": 52,
    "english": "Abraham",
    "turkish": "İbrâhîm",
    "place": "Makkah",
    "arabic": "سُورَةُ إِبۡرَاهِيمَ"
  },
  {
    "id": 15,
    "name": "Al Hijr",
    "aya": 99,
    "english": "The Stoneland",
    "turkish": "Hicr",
    "place": "Makkah",
    "arabic": "سُورَةُ الحِجۡرِ"
  },
  {
    "id": 16,
    "name": "An Nahl",
    "aya": 128,
    "english": "The Honey Bee",
    "turkish": "Nahl",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّحۡلِ"
  },
  {
    "id": 17,
    "name": "Al Isra'",
    "aya": 111,
    "english": "The Night Journey",
    "turkish": "İsrâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الإِسۡرَاءِ"
  },
  {
    "id": 18,
    "name": "Al Kahf",
    "aya": 110,
    "english": "The Cave",
    "turkish": "Kehf",
    "place": "Makkah",
    "arabic": "سُورَةُ الكَهۡفِ"
  },
  {
    "id": 19,
    "name": "Maryam",
    "aya": 98,
    "english": "Mary",
    "turkish": "Meryem",
    "place": "Makkah",
    "arabic": "سُورَةُ مَرۡيَمَ"
  },
  {
    "id": 20,
    "name": "Ta Ha",
    "aya": 135,
    "english": "Ta Ha",
    "turkish": "Tâhâ",
    "place": "Makkah",
    "arabic": "سُورَةُ طه"
  },
  {
    "id": 21,
    "name": "Al Anbiya",
    "aya": 112,
    "english": "The Prophets",
    "turkish": "Enbiyâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الأَنبِيَاءِ"
  },
  {
    "id": 22,
    "name": "Al Hajj",
    "aya": 78,
    "english": "The Pilgrimage",
    "turkish": "Hac",
    "place": "Madinah",
    "arabic": "سُورَةُ الحَجِّ"
  },
  {
    "id": 23,
    "name": "Al Mu minun",
    "aya": 118,
    "english": "The Believers",
    "turkish": "Mü'minûn",
    "place": "Makkah",
    "arabic": "سُورَةُ المُؤۡمِنُونَ"
  },
  {
    "id": 24,
    "name": "An Nur",
    "aya": 64,
    "english": "The Light",
    "turkish": "Nûr",
    "place": "Madinah",
    "arabic": "سُورَةُ النُّورِ"
  },
  {
    "id": 25,
    "name": "Al Furqan",
    "aya": 77,
    "english": "The Criterion",
    "turkish": "Furkân",
    "place": "Makkah",
    "arabic": "سُورَةُ الفُرۡقَانِ"
  },
  {
    "id": 26,
    "name": "As Su'ara",
    "aya": 227,
    "english": "The Poets",
    "turkish": "Şuarâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الشُّعَرَاءِ"
  },
  {
    "id": 27,
    "name": "An Naml",
    "aya": 93,
    "english": "The Ant",
    "turkish": "Neml",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّمۡلِ"
  },
  {
    "id": 28,
    "name": "Al Qasas",
    "aya": 88,
    "english": "The Narrations",
    "turkish": "Kasas",
    "place": "Makkah",
    "arabic": "سُورَةُ القَصَصِ"
  },
  {
    "id": 29,
    "name": "Al Ankabut",
    "aya": 69,
    "english": "The Spider",
    "turkish": "Ankebût",
    "place": "Makkah",
    "arabic": "سُورَةُ العَنكَبُوتِ"
  },
  {
    "id": 30,
    "name": "Ar Rum",
    "aya": 60,
    "english": "Rome",
    "turkish": "Rûm",
    "place": "Makkah",
    "arabic": "سُورَةُ الرُّومِ"
  },
  {
    "id": 31,
    "name": "Luqman",
    "aya": 34,
    "english": "Luqman",
    "turkish": "Lokmân",
    "place": "Makkah",
    "arabic": "سُورَةُ لُقۡمَانَ"
  },
  {
    "id": 32,
    "name": "As Sajdah",
    "aya": 30,
    "english": "The Prostration",
    "turkish": "Secde",
    "place": "Makkah",
    "arabic": "سُورَةُ السَّجۡدَةِ"
  },
  {
    "id": 33,
    "name": "Al Ahzab",
    "aya": 73,
    "english": "The Clans",
    "turkish": "Ahzâb",
    "place": "Madinah",
    "arabic": "سُورَةُ الأَحۡزَابِ"
  },
  {
    "id": 34,
    "name": "Saba'",
    "aya": 54,
    "english": "Sheba",
    "turkish": "Sebe'",
    "place": "Makkah",
    "arabic": "سُورَةُ سَبَإٍ"
  },
  {
    "id": 35,
    "name": "Fatir",
    "aya": 45,
    "english": "The Originator",
    "turkish": "Fâtır",
    "place": "Makkah",
    "arabic": "سُورَةُ فَاطِرٍ"
  },
  {
    "id": 36,
    "name": "Ya'sin",
    "aya": 83,
    "english": "Ya Sin",
    "turkish": "Yâsîn",
    "place": "Makkah",
    "arabic": "سُورَةُ يسٓ"
  },
  {
    "id": 37,
    "name": "As Saffat",
    "aya": 182,
    "english": "Those Who Set The Ranks",
    "turkish": "Sâffât",
    "place": "Makkah",
    "arabic": "سُورَةُ الصَّافَّاتِ"
  },
  {
    "id": 38,
    "name": "Saad",
    "aya": 88,
    "english": "Ṣād",
    "turkish": "Sâd",
    "place": "Makkah",
    "arabic": "سُورَةُ صٓ"
  },
  {
    "id": 39,
    "name": "Az Zumar",
    "aya": 75,
    "english": "The Crowds",
    "turkish": "Zümer",
    "place": "Makkah",
    "arabic": "سُورَةُ الزُّمَرِ"
  },
  {
    "id": 40,
    "name": "Ghafir",
    "aya": 85,
    "english": "The Forgiver",
    "turkish": "Mü'min",
    "place": "Makkah",
    "arabic": "سُورَةُ غَافِرٍ"
  },
  {
    "id": 41,
    "name": "Fussilat",
    "aya": 54,
    "english": "Expounded",
    "turkish": "Fussilet",
    "place": "Makkah",
    "arabic": "سُورَةُ فُصِّلَتۡ"
  },
  {
    "id": 42,
    "name": "As Sura",
    "aya": 53,
    "english": "The Consultation",
    "turkish": "Şûrâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الشُّورَىٰ"
  },
  {
    "id": 43,
    "name": "Az Zukhruf",
    "aya": 89,
    "english": "The Gold Adornments",
    "turkish": "Zuhruf",
    "place": "Makkah",
    "arabic": "سُورَةُ الزُّخۡرُفِ"
  },
  {
    "id": 44,
    "name": "Ad Dukhan",
    "aya": 59,
    "english": "The Smoke",
    "turkish": "Duhân",
    "place": "Makkah",
    "arabic": "سُورَةُ الدُّخَانِ"
  },
  {
    "id": 45,
    "name": "Al Jaathiyah",
    "aya": 37,
    "english": "The Kneeling Down",
    "turkish": "Câsiye",
    "place": "Makkah",
    "arabic": "سُورَةُ الجَاثِيَةِ"
  },
  {
    "id": 46,
    "name": "Al Ahqaf",
    "aya": 35,
    "english": "Winding Sand tracts",
    "turkish": "Ahkâf",
    "place": "Makkah",
    "arabic": "سُورَةُ الأَحۡقَافِ"
  },
  {
    "id": 47,
    "name": "Muhammad",
    "aya": 38,
    "english": "Muhammad",
    "turkish": "Muhammed",
    "place": "Madinah",
    "arabic": "سُورَةُ مُحَمَّدٍ"
  },
  {
    "id": 48,
    "name": "Al Fath",
    "aya": 29,
    "english": "The Victory",
    "turkish": "Fetih",
    "place": "Madinah",
    "arabic": "سُورَةُ الفَتۡحِ"
  },
  {
    "id": 49,
    "name": "Al Hujurut",
    "aya": 18,
    "english": "The Private Apartments",
    "turkish": "Hucurât",
    "place": "Madinah",
    "arabic": "سُورَةُ الحُجُرَاتِ"
  },
  {
    "id": 50,
    "name": "Qaaf",
    "aya": 45,
    "english": "Q̈āf",
    "turkish": "Kâf",
    "place": "Makkah",
    "arabic": "سُورَةُ قٓ"
  },
  {
    "id": 51,
    "name": "Ad Dariyat",
    "aya": 60,
    "english": "The Wind That Scatter",
    "turkish": "Zâriyât",
    "place": "Makkah",
    "arabic": "سُورَةُ الذَّارِيَاتِ"
  },
  {
    "id": 52,
    "name": "At Toor",
    "aya": 49,
    "english": "The Mount",
    "turkish": "Tûr",
    "place": "Makkah",
    "arabic": "سُورَةُ الطُّورِ"
  },
  {
    "id": 53,
    "name": "An Najm",
    "aya": 62,
    "english": "The Star",
    "turkish": "Necm",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّجۡمِ"
  },
  {
    "id": 54,
    "name": "Al Qamar",
    "aya": 55,
    "english": "The Moon",
    "turkish": "Kamer",
    "place": "Makkah",
    "arabic": "سُورَةُ القَمَرِ"
  },
  {
    "id": 55,
    "name": "Ar Rahman",
    "aya": 78,
    "english": "The Most Merciful",
    "turkish": "Rahmân",
    "place": "Madinah",
    "arabic": "سُورَةُ الرَّحۡمَٰن"
  },
  {
    "id": 56,
    "name": "Al Waqiah",
    "aya": 96,
    "english": "The Inevitable",
    "turkish": "Vâkıa",
    "place": "Makkah",
    "arabic": "سُورَةُ الوَاقِعَةِ"
  },
  {
    "id": 57,
    "name": "Al Hadeed",
    "aya": 29,
    "english": "The Iron",
    "turkish": "Hadîd",
    "place": "Madinah",
    "arabic": "سُورَةُ الحَدِيدِ"
  },
  {
    "id": 58,
    "name": "Al Mujadila",
    "aya": 22,
    "english": "The Pleading",
    "turkish": "Mücâdele",
    "place": "Madinah",
    "arabic": "سُورَةُ المُجَادلَةِ"
  },
  {
    "id": 59,
    "name": "Al Hashr",
    "aya": 24,
    "english": "The Mustering",
    "turkish": "Haşr",
    "place": "Manidah",
    "arabic": "سُورَةُ الحَشۡرِ"
  },
  {
    "id": 60,
    "name": "Al Mumtahanah",
    "aya": 13,
    "english": "The Examined One",
    "turkish": "Mümtehine",
    "place": "Madinah",
    "arabic": "سُورَةُ المُمۡتَحنَةِ"
  },
  {
    "id": 61,
    "name": "As Saff",
    "aya": 14,
    "english": "The Ranks",
    "turkish": "Saff",
    "place": "Madinah",
    "arabic": "سُورَةُ الصَّفِّ"
  },
  {
    "id": 62,
    "name": "Al Jumu'ah",
    "aya": 11,
    "english": "Congregation (Friday)",
    "turkish": "Cuma",
    "place": "Madinah",
    "arabic": "سُورَةُ الجُمُعَةِ"
  },
  {
    "id": 63,
    "name": "Al Munafiqoon",
    "aya": 11,
    "english": "The Hypocrites",
    "turkish": "Münâfikûn",
    "place": "Madinah",
    "arabic": "سُورَةُ المُنَافِقُونَ"
  },
  {
    "id": 64,
    "name": "At Taghabun",
    "aya": 18,
    "english": "The Cheating",
    "turkish": "Tegâbün",
    "place": "Madinah",
    "arabic": "سُورَةُ التَّغَابُنِ"
  },
  {
    "id": 65,
    "name": "At Talaq",
    "aya": 12,
    "english": "Divorce",
    "turkish": "Talâk",
    "place": "Madinah",
    "arabic": "سُورَةُ الطَّلَاقِ"
  },
  {
    "id": 66,
    "name": "At Tahreem",
    "aya": 12,
    "english": "The Prohibition",
    "turkish": "Tahrîm",
    "place": "Madinah",
    "arabic": "سُورَةُ التَّحۡرِيمِ"
  },
  {
    "id": 67,
    "name": "Al Mulk",
    "aya": 30,
    "english": "The Dominion",
    "turkish": "Mülk",
    "place": "Makkah",
    "arabic": "سُورَةُ المُلۡكِ"
  },
  {
    "id": 68,
    "name": "Al Qalam",
    "aya": 52,
    "english": "The Pen",
    "turkish": "Kalem",
    "place": "Makkah",
    "arabic": "سُورَةُ القَلَمِ"
  },
  {
    "id": 69,
    "name": "Al Haaqqah",
    "aya": 52,
    "english": "The Sure Reality",
    "turkish": "Hâkka",
    "place": "Makkah",
    "arabic": "سُورَةُ الحَاقَّةِ"
  },
  {
    "id": 70,
    "name": "Al Ma'arij",
    "aya": 44,
    "english": "The Ways of Ascent",
    "turkish": "Meâric",
    "place": "Makkah",
    "arabic": "سُورَةُ المَعَارِجِ"
  },
  {
    "id": 71,
    "name": "Nooh",
    "aya": 28,
    "english": "Noah",
    "turkish": "Nûh",
    "place": "Makkah",
    "arabic": "سُورَةُ نُوحٍ"
  },
  {
    "id": 72,
    "name": "Al Jinn",
    "aya": 28,
    "english": "The Jinn",
    "turkish": "Cin",
    "place": "makkah",
    "arabic": "سُورَةُ الجِنِّ"
  },
  {
    "id": 73,
    "name": "Al Muzammil",
    "aya": 20,
    "english": "The Enfolded One",
    "turkish": "Müzzemmil",
    "place": "Makkah",
    "arabic": "سُورَةُ المُزَّمِّلِ"
  },
  {
    "id": 74,
    "name": "Al Muddathir",
    "aya": 56,
    "english": "The One Wrapped Up",
    "turkish": "Müddessir",
    "place": "Makkah",
    "arabic": "سُورَةُ المُدَّثِّرِ"
  },
  {
    "id": 75,
    "name": "Al Qiyamah",
    "aya": 40,
    "english": "Resurrection",
    "turkish": "Kıyâmet",
    "place": "Makkah",
    "arabic": "سُورَةُ القِيَامَةِ"
  },
  {
    "id": 76,
    "name": "Al Insaan",
    "aya": 31,
    "english": "The Human",
    "turkish": "İnsân",
    "place": "Madinah",
    "arabic": "سُورَةُ الإِنسَانِ"
  },
  {
    "id": 77,
    "name": "Al Mursalat",
    "aya": 50,
    "english": "Those Sent Forth",
    "turkish": "Mürselât",
    "place": "Makkah",
    "arabic": "سُورَةُ المُرۡسَلَاتِ"
  },
  {
    "id": 78,
    "name": "An Naba",
    "aya": 40,
    "english": "The Great News",
    "turkish": "Nebe",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّبَإِ"
  },
  {
    "id": 79,
    "name": "An Naaziat",
    "aya": 46,
    "english": "Those Who Tear Out",
    "turkish": "Naziât",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّازِعَاتِ"
  },
  {
    "id": 80,
    "name": "Abasa",
    "aya": 42,
    "english": "He Frowned",
    "turkish": "Abese",
    "place": "Makkah",
    "arabic": "سُورَةُ عَبَسَ"
  },
  {
    "id": 81,
    "name": "At Takweer",
    "aya": 29,
    "english": "The Folding Up",
    "turkish": "Tekvîr",
    "place": "Makkah",
    "arabic": "سُورَةُ التَّكۡوِيرِ"
  },
  {
    "id": 82,
    "name": "Al Infitar",
    "aya": 19,
    "english": "The Overthrowing",
    "turkish": "İnfitâr",
    "place": "Makkah",
    "arabic": "سُورَةُ الانفِطَارِ"
  },
  {
    "id": 83,
    "name": "Al Mutaffifin",
    "aya": 36,
    "english": "The Cleaving Asunder",
    "turkish": "Mutaffifîn",
    "place": "Makkah",
    "arabic": "سُورَةُ المُطَفِّفِينَ"
  },
  {
    "id": 84,
    "name": "Al Inshiqaaq",
    "aya": 25,
    "english": "The Dealers in Fraud",
    "turkish": "İnşikâk",
    "place": "Makkah",
    "arabic": "سُورَةُ الانشِقَاقِ"
  },
  {
    "id": 85,
    "name": "Al Burooj",
    "aya": 22,
    "english": "The Constellations",
    "turkish": "Burûc",
    "place": "Makkah",
    "arabic": "سُورَةُ البُرُوجِ"
  },
  {
    "id": 86,
    "name": "At Taariq",
    "aya": 17,
    "english": "The Morning Star",
    "turkish": "Târık",
    "place": "Makkah",
    "arabic": "سُورَةُ الطَّارِقِ"
  },
  {
    "id": 87,
    "name": "Al A'laa",
    "aya": 19,
    "english": "The Most High",
    "turkish": "A'lâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الأَعۡلَىٰ"
  },
  {
    "id": 88,
    "name": "Al Ghaashiyah",
    "aya": 26,
    "english": "The Overwhelming Event",
    "turkish": "Gâşiye",
    "place": "Makkah",
    "arabic": "سُورَةُ الغَاشِيَةِ"
  },
  {
    "id": 89,
    "name": "Al Fajr",
    "aya": 30,
    "english": "The Daybreak",
    "turkish": "Fecr",
    "place": "Makkah",
    "arabic": "سُورَةُ الفَجۡرِ"
  },
  {
    "id": 90,
    "name": "Al Balad",
    "aya": 20,
    "english": "The City",
    "turkish": "Beled",
    "place": "Makkah",
    "arabic": "سُورَةُ البَلَدِ"
  },
  {
    "id": 91,
    "name": "Ash Shams",
    "aya": 15,
    "english": "The Sun",
    "turkish": "Şems",
    "place": "Makkah",
    "arabic": "سُورَةُ الشَّمۡسِ"
  },
  {
    "id": 92,
    "name": "Al Layl",
    "aya": 21,
    "english": "The Night",
    "turkish": "Leyl",
    "place": "Makkah",
    "arabic": "سُورَةُ اللَّيۡلِ"
  },
  {
    "id": 93,
    "name": "Ad Dhuha",
    "aya": 11,
    "english": "The Glorious Morning Light",
    "turkish": "Duhâ",
    "place": "Makkah",
    "arabic": "سُورَةُ الضُّحَىٰ"
  },
  {
    "id": 94,
    "name": "Ash Sharh",
    "aya": 8,
    "english": "The Opening Up of the Heart",
    "turkish": "İnşirâh",
    "place": "Makkah",
    "arabic": "سُورَةُ الشَّرۡحِ"
  },
  {
    "id": 95,
    "name": "At Teen",
    "aya": 8,
    "english": "The Fig Tree",
    "turkish": "Tîn",
    "place": "Makkah",
    "arabic": "سُورَةُ التِّينِ"
  },
  {
    "id": 96,
    "name": "Al Alaq",
    "aya": 19,
    "english": "The Clinging Clot",
    "turkish": "Alak",
    "place": "Makkah",
    "arabic": "سُورَةُ العَلَقِ"
  },
  {
    "id": 97,
    "name": "Al Qadr",
    "aya": 5,
    "english": "The Night of Honor",
    "turkish": "Kadir",
    "place": "Makkah",
    "arabic": "سُورَةُ القَدۡرِ"
  },
  {
    "id": 98,
    "name": "Al Bayyinah",
    "aya": 8,
    "english": "The Clear Evidence",
    "turkish": "Beyyine",
    "place": "Madinah",
    "arabic": "سُورَةُ البَيِّنَةِ"
  },
  {
    "id": 99,
    "name": "Az Zalzalah",
    "aya": 8,
    "english": "The Earthquake",
    "turkish": "Zilzâl",
    "place": "Madinah",
    "arabic": "سُورَةُ الزَّلۡزَلَةِ"
  },
  {
    "id": 100,
    "name": "Al Aadiyaat",
    "aya": 11,
    "english": "The Courser",
    "turkish": "Âdiyât",
    "place": "Makkah",
    "arabic": "سُورَةُ العَادِيَاتِ"
  },
  {
    "id": 101,
    "name": "Al Qaari'ah",
    "aya": 11,
    "english": "The Striking Hour",
    "turkish": "Kâria",
    "place": "Makkah",
    "arabic": "سُورَةُ القَارِعَةِ"
  },
  {
    "id": 102,
    "name": "At Takaathur",
    "aya": 8,
    "english": "The Piling Up",
    "turkish": "Tekâsür",
    "place": "Makkah",
    "arabic": "سُورَةُ التَّكَاثُرِ"
  },
  {
    "id": 103,
    "name": "Al Asr",
    "aya": 3,
    "english": "The Time",
    "turkish": "Asr",
    "place": "Makkah",
    "arabic": "سُورَةُ العَصۡرِ"
  },
  {
    "id": 104,
    "name": "Al Humazah",
    "aya": 9,
    "english": "The Scandalmonger",
    "turkish": "Hümeze",
    "place": "Makkah",
    "arabic": "سُورَةُ الهُمَزَةِ"
  },
  {
    "id": 105,
    "name": "Al Feel",
    "aya": 5,
    "english": "The Elephant",
    "turkish": "Fîl",
    "place": "Makkah",
    "arabic": "سُورَةُ الفِيلِ"
  },
  {
    "id": 106,
    "name": "Quraysh",
    "aya": 4,
    "english": "The Quraysh",
    "turkish": "Kureyş",
    "place": "Makkah",
    "arabic": "سُورَةُ قُرَيۡشٍ"
  },
  {
    "id": 107,
    "name": "Al Maa'oon",
    "aya": 7,
    "english": "The Neighbourly Assistance",
    "turkish": "Maûn",
    "place": "Makkah",
    "arabic": "سُورَةُ المَاعُونِ"
  },
  {
    "id": 108,
    "name": "Al Kawthar",
    "aya": 3,
    "english": "Abundance",
    "turkish": "Kevser",
    "place": "Makkah",
    "arabic": "سُورَةُ الكَوۡثَرِ"
  },
  {
    "id": 109,
    "name": "Al Kaafiroon",
    "aya": 6,
    "english": "The Disbelievers",
    "turkish": "Kâfirûn",
    "place": "Makkah",
    "arabic": "سُورَةُ الكَافِرُونَ"
  },
  {
    "id": 110,
    "name": "An Nasr",
    "aya": 3,
    "english": "The Help",
    "turkish": "Nasr",
    "place": "Madinah",
    "arabic": "سُورَةُ النَّصۡرِ"
  },
  {
    "id": 111,
    "name": "Al Masad",
    "aya": 5,
    "english": "The Plaited Rope",
    "turkish": "Tebbet",
    "place": "Makkah",
    "arabic": "سُورَةُ المَسَدِ"
  },
  {
    "id": 112,
    "name": "Al Ikhlaas",
    "aya": 4,
    "english": "Purity of Faith",
    "turkish": "İhlâs",
    "place": "Makkah",
    "arabic": "سُورَةُ الإِخۡلَاصِ"
  },
  {
    "id": 113,
    "name": "Al Falaq",
    "aya": 5,
    "english": "The Rising Dawn",
    "turkish": "Felak",
    "place": "Makkah",
    "arabic": "سُورَةُ الفَلَقِ"
  },
  {
    "id": 114,
    "name": "An Naas",
    "aya": 6,
    "english": "Mankind",
    "turkish": "Nâs",
    "place": "Makkah",
    "arabic": "سُورَةُ النَّاسِ"
  }
];

List surahDetailsList = [
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 7,
    "revelationOrder": 5,
    "rukus": 1,
    "title": "Al-Fatiha",
    "titleAr": "الفاتحة",
    "titleEn": "The Opening",
    "index": "001",
    "pages": "1",
    "page": "1",
    "start": 0,
    "juz": [
      {
        "index": "01",
        "verse": {"start": "verse_1", "end": "verse_7"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 286,
    "revelationOrder": 87,
    "rukus": 40,
    "title": "Al-Baqara",
    "titleAr": "البقرة",
    "titleEn": "The Cow",
    "index": "002",
    "pages": "2",
    "page": "2",
    "start": 7,
    "juz": [
      {
        "index": "01",
        "verse": {"start": "verse_1", "end": "verse_141"}
      },
      {
        "index": "02",
        "verse": {"start": "verse_142", "end": "verse_252"}
      },
      {
        "index": "03",
        "verse": {"start": "verse_253", "end": "verse_286"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 200,
    "revelationOrder": 89,
    "rukus": 20,
    "title": "Aal-Imran",
    "titleAr": "آل عمران",
    "titleEn": "The Family of Imraan",
    "index": "003",
    "pages": "45",
    "page": "50",
    "start": 293,
    "juz": [
      {
        "index": "03",
        "verse": {"start": "verse_1", "end": "verse_92"}
      },
      {
        "index": "04",
        "verse": {"start": "verse_93", "end": "verse_200"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 176,
    "revelationOrder": 92,
    "rukus": 24,
    "title": "An-Nisaa'",
    "titleAr": "النساء",
    "titleEn": "The Women",
    "index": "004",
    "pages": "69",
    "page": "77",
    "start": 493,
    "juz": [
      {
        "index": "04",
        "verse": {"start": "verse_1", "end": "verse_23"}
      },
      {
        "index": "05",
        "verse": {"start": "verse_24", "end": "verse_147"}
      },
      {
        "index": "06",
        "verse": {"start": "verse_148", "end": "verse_176"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 120,
    "revelationOrder": 112,
    "rukus": 16,
    "title": "Al-Ma'ida",
    "titleAr": "المائدة",
    "titleEn": "The Table",
    "index": "005",
    "pages": "95",
    "page": "106",
    "start": 669,
    "juz": [
      {
        "index": "06",
        "verse": {"start": "verse_1", "end": "verse_81"}
      },
      {
        "index": "07",
        "verse": {"start": "verse_82", "end": "verse_120"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 165,
    "revelationOrder": 55,
    "rukus": 20,
    "title": "Al-An'am",
    "titleAr": "الأنعام",
    "titleEn": "The Cattle",
    "index": "006",
    "pages": "115",
    "page": "128",
    "start": 789,
    "juz": [
      {
        "index": "07",
        "verse": {"start": "verse_1", "end": "verse_110"}
      },
      {
        "index": "08",
        "verse": {"start": "verse_111", "end": "verse_165"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 206,
    "revelationOrder": 39,
    "rukus": 24,
    "title": "Al-A'raf",
    "titleAr": "الأعراف",
    "titleEn": "The Heights",
    "index": "007",
    "pages": "136",
    "page": "151",
    "start": 954,
    "juz": [
      {
        "index": "08",
        "verse": {"start": "verse_1", "end": "verse_87"}
      },
      {
        "index": "09",
        "verse": {"start": "verse_88", "end": "verse_206"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 75,
    "revelationOrder": 88,
    "rukus": 10,
    "title": "Al-Anfal",
    "titleAr": "الأنفال",
    "titleEn": "The Spoils of War",
    "index": "008",
    "pages": "160",
    "page": "177",
    "start": 1160,
    "juz": [
      {
        "index": "09",
        "verse": {"start": "verse_1", "end": "verse_40"}
      },
      {
        "index": "10",
        "verse": {"start": "verse_41", "end": "verse_75"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 129,
    "revelationOrder": 113,
    "rukus": 16,
    "title": "Al-Tawba",
    "titleAr": "التوبة",
    "titleEn": "The Repentance",
    "index": "009",
    "pages": "169",
    "page": "187",
    "start": 1235,
    "juz": [
      {
        "index": "10",
        "verse": {"start": "verse_1", "end": "verse_92"}
      },
      {
        "index": "11",
        "verse": {"start": "verse_93", "end": "verse_129"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 109,
    "revelationOrder": 51,
    "rukus": 11,
    "title": "Yunus",
    "titleAr": "يونس",
    "titleEn": "Jonas",
    "index": "010",
    "pages": "187",
    "page": "208",
    "start": 1364,
    "juz": [
      {
        "index": "11",
        "verse": {"start": "verse_1", "end": "verse_109"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 123,
    "revelationOrder": 52,
    "rukus": 10,
    "title": "Hud",
    "titleAr": "هود",
    "titleEn": "Hud",
    "index": "011",
    "pages": "199",
    "page": "221",
    "start": 1473,
    "juz": [
      {
        "index": "11",
        "verse": {"start": "verse_1", "end": "verse_5"}
      },
      {
        "index": "12",
        "verse": {"start": "verse_6", "end": "verse_123"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 111,
    "revelationOrder": 53,
    "rukus": 12,
    "title": "Yusuf",
    "titleAr": "يوسف",
    "titleEn": "Joseph",
    "index": "012",
    "pages": "212",
    "page": "235",
    "start": 1596,
    "juz": [
      {
        "index": "12",
        "verse": {"start": "verse_1", "end": "verse_52"}
      },
      {
        "index": "13",
        "verse": {"start": "verse_53", "end": "verse_111"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 43,
    "revelationOrder": 96,
    "rukus": 6,
    "title": "Ar-Ra'd",
    "titleAr": "الرعد",
    "titleEn": "The Thunder",
    "index": "013",
    "pages": "225",
    "page": "249",
    "start": 1707,
    "juz": [
      {
        "index": "13",
        "verse": {"start": "verse_1", "end": "verse_43"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 52,
    "revelationOrder": 72,
    "rukus": 7,
    "title": "Ibrahim",
    "titleAr": "إبراهيم",
    "titleEn": "Abraham",
    "index": "014",
    "pages": "231",
    "page": "255",
    "start": 1750,
    "juz": [
      {
        "index": "13",
        "verse": {"start": "verse_1", "end": "verse_52"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 99,
    "revelationOrder": 54,
    "rukus": 6,
    "title": "Al-Hijr",
    "titleAr": "الحجر",
    "titleEn": "The Rock",
    "index": "015",
    "pages": "237",
    "page": "262",
    "start": 1802,
    "juz": [
      {
        "index": "14",
        "verse": {"start": "verse_1", "end": "verse_99"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 128,
    "revelationOrder": 70,
    "rukus": 16,
    "title": "An-Nahl",
    "titleAr": "النحل",
    "titleEn": "The Bee",
    "index": "016",
    "pages": "242",
    "page": "267",
    "start": 1901,
    "juz": [
      {
        "index": "14",
        "verse": {"start": "verse_1", "end": "verse_128"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 111,
    "revelationOrder": 50,
    "rukus": 12,
    "title": "Al-Israa",
    "titleAr": "الإسراء",
    "titleEn": "The Night Journey",
    "index": "017",
    "pages": "255",
    "page": "282",
    "start": 2029,
    "juz": [
      {
        "index": "15",
        "verse": {"start": "verse_1", "end": "verse_111"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 110,
    "revelationOrder": 69,
    "rukus": 12,
    "title": "Al-Kahf",
    "titleAr": "الكهف",
    "titleEn": "The Cave",
    "index": "018",
    "pages": "266",
    "page": "293",
    "start": 2140,
    "juz": [
      {
        "index": "15",
        "verse": {"start": "verse_1", "end": "verse_74"}
      },
      {
        "index": "16",
        "verse": {"start": "verse_75", "end": "verse_110"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 98,
    "revelationOrder": 44,
    "rukus": 6,
    "title": "Maryam",
    "titleAr": "مريم",
    "titleEn": "Mary",
    "index": "019",
    "pages": "277",
    "page": "305",
    "start": 2250,
    "juz": [
      {
        "index": "16",
        "verse": {"start": "verse_1", "end": "verse_98"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 135,
    "revelationOrder": 45,
    "rukus": 8,
    "title": "Ta-Ha",
    "titleAr": "طه",
    "titleEn": "Taa-Haa",
    "index": "020",
    "pages": "284",
    "page": "312",
    "start": 2348,
    "juz": [
      {
        "index": "16",
        "verse": {"start": "verse_1", "end": "verse_135"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 112,
    "revelationOrder": 73,
    "rukus": 7,
    "title": "Al-Anbiya",
    "titleAr": "الأنبياء",
    "titleEn": "The Prophets",
    "index": "021",
    "pages": "294",
    "page": "322",
    "start": 2483,
    "juz": [
      {
        "index": "17",
        "verse": {"start": "verse_1", "end": "verse_112"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 78,
    "revelationOrder": 103,
    "rukus": 10,
    "title": "Al-Hajj",
    "titleAr": "الحج",
    "titleEn": "The Pilgrimage",
    "index": "022",
    "pages": "302",
    "page": "332",
    "start": 2595,
    "juz": [
      {
        "index": "17",
        "verse": {"start": "verse_1", "end": "verse_78"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 118,
    "revelationOrder": 74,
    "rukus": 6,
    "title": "Al-Muminun",
    "titleAr": "المؤمنون",
    "titleEn": "The Believers",
    "index": "023",
    "pages": "311",
    "page": "342",
    "start": 2673,
    "juz": [
      {
        "index": "18",
        "verse": {"start": "verse_1", "end": "verse_118"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 64,
    "revelationOrder": 102,
    "rukus": 9,
    "title": "An-Nur",
    "titleAr": "النور",
    "titleEn": "The Light",
    "index": "024",
    "pages": "319",
    "page": "350",
    "start": 2791,
    "juz": [
      {
        "index": "18",
        "verse": {"start": "verse_1", "end": "verse_64"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 77,
    "revelationOrder": 42,
    "rukus": 6,
    "title": "Al-Furqan",
    "titleAr": "الفرقان",
    "titleEn": "The Criterion",
    "index": "025",
    "pages": "329",
    "page": "359",
    "start": 2855,
    "juz": [
      {
        "index": "18",
        "verse": {"start": "verse_1", "end": "verse_20"}
      },
      {
        "index": "19",
        "verse": {"start": "verse_21", "end": "verse_77"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 227,
    "revelationOrder": 47,
    "rukus": 11,
    "title": "Ash-Shuara",
    "titleAr": "الشعراء",
    "titleEn": "The Poets",
    "index": "026",
    "pages": "335",
    "page": "367",
    "start": 2932,
    "juz": [
      {
        "index": "19",
        "verse": {"start": "verse_1", "end": "verse_227"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 93,
    "revelationOrder": 48,
    "rukus": 7,
    "title": "An-Naml",
    "titleAr": "النمل",
    "titleEn": "The Ant",
    "index": "027",
    "pages": "345",
    "page": "377",
    "start": 3159,
    "juz": [
      {
        "index": "19",
        "verse": {"start": "verse_1", "end": "verse_55"}
      },
      {
        "index": "20",
        "verse": {"start": "verse_56", "end": "verse_93"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 88,
    "revelationOrder": 49,
    "rukus": 8,
    "title": "Al-Qasas",
    "titleAr": "القصص",
    "titleEn": "The Stories",
    "index": "028",
    "pages": "354",
    "page": "385",
    "start": 3252,
    "juz": [
      {
        "index": "20",
        "verse": {"start": "verse_1", "end": "verse_88"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 69,
    "revelationOrder": 85,
    "rukus": 7,
    "title": "Al-Ankabut",
    "titleAr": "العنكبوت",
    "titleEn": "The Spider",
    "index": "029",
    "pages": "364",
    "page": "396",
    "start": 3340,
    "juz": [
      {
        "index": "20",
        "verse": {"start": "verse_1", "end": "verse_45"}
      },
      {
        "index": "21",
        "verse": {"start": "verse_46", "end": "verse_69"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 60,
    "revelationOrder": 84,
    "rukus": 6,
    "title": "Ar-Rum",
    "titleAr": "الروم",
    "titleEn": "The Romans",
    "index": "030",
    "pages": "371",
    "page": "404",
    "start": 3409,
    "juz": [
      {
        "index": "21",
        "verse": {"start": "verse_1", "end": "verse_60"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 34,
    "revelationOrder": 57,
    "rukus": 3,
    "title": "Luqman",
    "titleAr": "لقمان",
    "titleEn": "Luqman",
    "index": "031",
    "pages": "377",
    "page": "411",
    "start": 3469,
    "juz": [
      {
        "index": "21",
        "verse": {"start": "verse_1", "end": "verse_34"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 30,
    "revelationOrder": 75,
    "rukus": 3,
    "title": "As-Sajdah",
    "titleAr": "السجدة",
    "titleEn": "The Prostration",
    "index": "032",
    "pages": "381",
    "page": "415",
    "start": 3503,
    "juz": [
      {
        "index": "21",
        "verse": {"start": "verse_1", "end": "verse_30"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 73,
    "revelationOrder": 90,
    "rukus": 9,
    "title": "Al-Ahzab",
    "titleAr": "الأحزاب",
    "titleEn": "The Clans",
    "index": "033",
    "pages": "383",
    "page": "418",
    "start": 3533,
    "juz": [
      {
        "index": "21",
        "verse": {"start": "verse_1", "end": "verse_30"}
      },
      {
        "index": "22",
        "verse": {"start": "verse_31", "end": "verse_73"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 54,
    "revelationOrder": 58,
    "rukus": 6,
    "title": "Saba",
    "titleAr": "سبأ",
    "titleEn": "Sheba",
    "index": "034",
    "pages": "393",
    "page": "428",
    "start": 3606,
    "juz": [
      {
        "index": "22",
        "verse": {"start": "verse_1", "end": "verse_54"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 45,
    "revelationOrder": 43,
    "rukus": 5,
    "title": "Fatir",
    "titleAr": "فاطر",
    "titleEn": "The Originator",
    "index": "035",
    "pages": "399",
    "page": "434",
    "start": 3660,
    "juz": [
      {
        "index": "22",
        "verse": {"start": "verse_1", "end": "verse_45"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 83,
    "revelationOrder": 41,
    "rukus": 5,
    "title": "Yasin",
    "titleAr": "يس",
    "titleEn": "Yaseen",
    "index": "036",
    "pages": "404",
    "page": "440",
    "start": 3705,
    "juz": [
      {
        "index": "22",
        "verse": {"start": "verse_1", "end": "verse_27"}
      },
      {
        "index": "23",
        "verse": {"start": "verse_28", "end": "verse_83"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 182,
    "revelationOrder": 56,
    "rukus": 5,
    "title": "As-Saffat",
    "titleAr": "الصافات",
    "titleEn": "Those drawn up in Ranks",
    "index": "037",
    "pages": "410",
    "page": "446",
    "start": 3788,
    "juz": [
      {
        "index": "23",
        "verse": {"start": "verse_1", "end": "verse_182"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 88,
    "revelationOrder": 38,
    "rukus": 5,
    "title": "Sad",
    "titleAr": "ص",
    "titleEn": "The letter Saad",
    "index": "038",
    "pages": "417",
    "page": "453",
    "start": 3970,
    "juz": [
      {
        "index": "23",
        "verse": {"start": "verse_1", "end": "verse_88"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 75,
    "revelationOrder": 59,
    "rukus": 8,
    "title": "Az-Zumar",
    "titleAr": "الزمر",
    "titleEn": "The Groups",
    "index": "039",
    "pages": "422",
    "page": "458",
    "start": 4058,
    "juz": [
      {
        "index": "23",
        "verse": {"start": "verse_1", "end": "verse_31"}
      },
      {
        "index": "24",
        "verse": {"start": "verse_32", "end": "verse_75"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 85,
    "revelationOrder": 60,
    "rukus": 9,
    "title": "Ghafir",
    "titleAr": "غافر",
    "titleEn": "The Forgiver",
    "index": "040",
    "pages": "431",
    "page": "467",
    "start": 4133,
    "juz": [
      {
        "index": "24",
        "verse": {"start": "verse_1", "end": "verse_85"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 54,
    "revelationOrder": 61,
    "rukus": 6,
    "title": "Fussilat",
    "titleAr": "فصلت",
    "titleEn": "Explained in detail",
    "index": "041",
    "pages": "439",
    "page": "477",
    "start": 4218,
    "juz": [
      {
        "index": "24",
        "verse": {"start": "verse_1", "end": "verse_46"}
      },
      {
        "index": "25",
        "verse": {"start": "verse_47", "end": "verse_54"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 53,
    "revelationOrder": 62,
    "rukus": 5,
    "title": "Ash-Shura",
    "titleAr": "الشورى",
    "titleEn": "Consultation",
    "index": "042",
    "pages": "445",
    "page": "483",
    "start": 4272,
    "juz": [
      {
        "index": "25",
        "verse": {"start": "verse_1", "end": "verse_53"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 89,
    "revelationOrder": 63,
    "rukus": 7,
    "title": "Az-Zukhruf",
    "titleAr": "الزخرف",
    "titleEn": "Ornaments of gold",
    "index": "043",
    "pages": "451",
    "page": "489",
    "start": 4325,
    "juz": [
      {
        "index": "25",
        "verse": {"start": "verse_1", "end": "verse_89"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 59,
    "revelationOrder": 64,
    "rukus": 3,
    "title": "Ad-Dukhan",
    "titleAr": "الدخان",
    "titleEn": "The Smoke",
    "index": "044",
    "pages": "457",
    "page": "496",
    "start": 4414,
    "juz": [
      {
        "index": "25",
        "verse": {"start": "verse_1", "end": "verse_59"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 37,
    "revelationOrder": 65,
    "rukus": 4,
    "title": "Al-Jathiya",
    "titleAr": "الجاثية",
    "titleEn": "Crouching",
    "index": "045",
    "pages": "460",
    "page": "499",
    "start": 4473,
    "juz": [
      {
        "index": "25",
        "verse": {"start": "verse_1", "end": "verse_37"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 35,
    "revelationOrder": 66,
    "rukus": 4,
    "title": "Al-Ahqaf",
    "titleAr": "الأحقاف",
    "titleEn": "The Dunes",
    "index": "046",
    "pages": "464",
    "page": "502",
    "start": 4510,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_35"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 38,
    "revelationOrder": 95,
    "rukus": 4,
    "title": "Muhammad",
    "titleAr": "محمد",
    "titleEn": "Muhammad",
    "index": "047",
    "pages": "468",
    "page": "507",
    "start": 4545,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_38"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 29,
    "revelationOrder": 111,
    "rukus": 4,
    "title": "Al-Fath",
    "titleAr": "الفتح",
    "titleEn": "The Victory",
    "index": "048",
    "pages": "472",
    "page": "511",
    "start": 4583,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_29"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 18,
    "revelationOrder": 106,
    "rukus": 2,
    "title": "Al-Hujurat",
    "titleAr": "الحجرات",
    "titleEn": "The Inner Apartments",
    "index": "049",
    "pages": "477",
    "page": "515",
    "start": 4612,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_18"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 45,
    "revelationOrder": 34,
    "rukus": 3,
    "title": "Qaf",
    "titleAr": "ق",
    "titleEn": "The letter Qaaf",
    "index": "050",
    "pages": "479",
    "page": "518",
    "start": 4630,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_45"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 60,
    "revelationOrder": 67,
    "rukus": 3,
    "title": "Az-Zariyat",
    "titleAr": "الذاريات",
    "titleEn": "The Winnowing Winds",
    "index": "051",
    "pages": "482",
    "page": "520",
    "start": 4675,
    "juz": [
      {
        "index": "26",
        "verse": {"start": "verse_1", "end": "verse_30"}
      },
      {
        "index": "27",
        "verse": {"start": "verse_31", "end": "verse_60"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 49,
    "revelationOrder": 76,
    "rukus": 2,
    "title": "At-Tur",
    "titleAr": "الطور",
    "titleEn": "The Mount",
    "index": "052",
    "pages": "485",
    "page": "523",
    "start": 4735,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_49"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 62,
    "revelationOrder": 23,
    "rukus": 3,
    "title": "An-Najm",
    "titleAr": "النجم",
    "titleEn": "The Star",
    "index": "053",
    "pages": "487",
    "page": "526",
    "start": 4784,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_62"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 55,
    "revelationOrder": 37,
    "rukus": 3,
    "title": "Al-Qamar",
    "titleAr": "القمر",
    "titleEn": "The Moon",
    "index": "054",
    "pages": "490",
    "page": "528",
    "start": 4846,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_55"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 78,
    "revelationOrder": 97,
    "rukus": 3,
    "title": "Ar-Rahman",
    "titleAr": "الرحمن",
    "titleEn": "The Beneficent",
    "index": "055",
    "pages": "493",
    "page": "531",
    "start": 4901,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_78"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 96,
    "revelationOrder": 46,
    "rukus": 3,
    "title": "Al-Waqia",
    "titleAr": "الواقعة",
    "titleEn": "The Inevitable",
    "index": "056",
    "pages": "496",
    "page": "534",
    "start": 4979,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_96"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 29,
    "revelationOrder": 94,
    "rukus": 4,
    "title": "Al-Hadid",
    "titleAr": "الحديد",
    "titleEn": "The Iron",
    "index": "057",
    "pages": "499",
    "page": "537",
    "start": 5075,
    "juz": [
      {
        "index": "27",
        "verse": {"start": "verse_1", "end": "verse_29"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 22,
    "revelationOrder": 105,
    "rukus": 3,
    "title": "Al-Mujadilah",
    "titleAr": "المجادلة",
    "titleEn": "The Pleading Woman",
    "index": "058",
    "pages": "504",
    "page": "542",
    "start": 5104,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_22"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 24,
    "revelationOrder": 101,
    "rukus": 3,
    "title": "Al-Hashr",
    "titleAr": "الحشر",
    "titleEn": "The Exile",
    "index": "059",
    "pages": "507",
    "page": "545",
    "start": 5126,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_24"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 13,
    "revelationOrder": 91,
    "rukus": 2,
    "title": "Al-Mumtahinah",
    "titleAr": "الممتحنة",
    "titleEn": "She that is to be examined",
    "index": "060",
    "pages": "510",
    "page": "549",
    "start": 5150,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_13"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 14,
    "revelationOrder": 109,
    "rukus": 2,
    "title": "As-Saff",
    "titleAr": "الصف",
    "titleEn": "The Ranks",
    "index": "061",
    "pages": "513",
    "page": "551",
    "start": 5163,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_14"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 11,
    "revelationOrder": 110,
    "rukus": 2,
    "title": "Al-Jumu'ah",
    "titleAr": "الجمعة",
    "titleEn": "Friday",
    "index": "062",
    "pages": "515",
    "page": "553",
    "start": 5177,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_11"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 11,
    "revelationOrder": 104,
    "rukus": 2,
    "title": "Al-Munafiqun",
    "titleAr": "المنافقون",
    "titleEn": "The Hypocrites",
    "index": "063",
    "pages": "516",
    "page": "554",
    "start": 5188,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_11"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 18,
    "revelationOrder": 108,
    "rukus": 2,
    "title": "At-Taghabun",
    "titleAr": "التغابن",
    "titleEn": "Mutual Disillusion",
    "index": "064",
    "pages": "518",
    "page": "556",
    "start": 5199,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_18"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 12,
    "revelationOrder": 99,
    "rukus": 2,
    "title": "At-Talaq",
    "titleAr": "الطلاق",
    "titleEn": "Divorce",
    "index": "065",
    "pages": "520",
    "page": "558",
    "start": 5217,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_12"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 12,
    "revelationOrder": 107,
    "rukus": 2,
    "title": "At-Tahrim",
    "titleAr": "التحريم",
    "titleEn": "The Prohibition",
    "index": "066",
    "pages": "522",
    "page": "560",
    "start": 5229,
    "juz": [
      {
        "index": "28",
        "verse": {"start": "verse_1", "end": "verse_12"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 30,
    "revelationOrder": 77,
    "rukus": 2,
    "title": "Al-Mulk",
    "titleAr": "الملك",
    "titleEn": "The Sovereignty",
    "index": "067",
    "pages": "524",
    "page": "562",
    "start": 5241,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_30"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 52,
    "revelationOrder": 2,
    "rukus": 2,
    "title": "Al-Qalam",
    "titleAr": "القلم",
    "titleEn": "The Pen",
    "index": "068",
    "pages": "526",
    "page": "564",
    "start": 5271,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_52"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 52,
    "revelationOrder": 78,
    "rukus": 2,
    "title": "Al-Haqqah",
    "titleAr": "الحاقة",
    "titleEn": "The Reality",
    "index": "069",
    "pages": "529",
    "page": "566",
    "start": 5323,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_52"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 44,
    "revelationOrder": 79,
    "rukus": 2,
    "title": "Al-Ma'arij",
    "titleAr": "المعارج",
    "titleEn": "The Ascending Stairways",
    "index": "070",
    "pages": "531",
    "page": "568",
    "start": 5375,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_44"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 28,
    "revelationOrder": 71,
    "rukus": 2,
    "title": "Nuh",
    "titleAr": "نوح",
    "titleEn": "Noah",
    "index": "071",
    "pages": "533",
    "page": "570",
    "start": 5419,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_28"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 28,
    "revelationOrder": 40,
    "rukus": 2,
    "title": "Al-Jinn",
    "titleAr": "الجن",
    "titleEn": "The Jinn",
    "index": "072",
    "pages": "534",
    "page": "572",
    "start": 5447,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_28"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 20,
    "revelationOrder": 3,
    "rukus": 2,
    "title": "Al-Muzzammil",
    "titleAr": "المزمل",
    "titleEn": "The Enshrouded One",
    "index": "073",
    "pages": "537",
    "page": "574",
    "start": 5475,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_20"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 56,
    "revelationOrder": 4,
    "rukus": 2,
    "title": "Al-Muddaththir",
    "titleAr": "المدثر",
    "titleEn": "The Cloaked One",
    "index": "074",
    "pages": "538",
    "page": "575",
    "start": 5495,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_56"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 40,
    "revelationOrder": 31,
    "rukus": 2,
    "title": "Al-Qiyamah",
    "titleAr": "القيامة",
    "titleEn": "The Resurrection",
    "index": "075",
    "pages": "540",
    "page": "577",
    "start": 5551,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_40"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 31,
    "revelationOrder": 98,
    "rukus": 2,
    "title": "Al-Insan",
    "titleAr": "الإنسان",
    "titleEn": "Man",
    "index": "076",
    "pages": "542",
    "page": "578",
    "start": 5591,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_31"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 50,
    "revelationOrder": 33,
    "rukus": 2,
    "title": "Al-Mursalat",
    "titleAr": "المرسلات",
    "titleEn": "The Emissaries",
    "index": "077",
    "pages": "544",
    "page": "580",
    "start": 5622,
    "juz": [
      {
        "index": "29",
        "verse": {"start": "verse_1", "end": "verse_50"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 40,
    "revelationOrder": 80,
    "rukus": 2,
    "title": "An-Naba",
    "titleAr": "النبأ",
    "titleEn": "The Announcement",
    "index": "078",
    "pages": "545",
    "page": "582",
    "start": 5672,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_40"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 46,
    "revelationOrder": 81,
    "rukus": 2,
    "title": "An-Naziat",
    "titleAr": "النازعات",
    "titleEn": "Those who drag forth",
    "index": "079",
    "pages": "547",
    "page": "583",
    "start": 5712,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_46"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 42,
    "revelationOrder": 24,
    "rukus": 1,
    "title": "Abasa",
    "titleAr": "عبس",
    "titleEn": "He frowned",
    "index": "080",
    "pages": "548",
    "page": "585",
    "start": 5758,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_42"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 29,
    "revelationOrder": 7,
    "rukus": 1,
    "title": "At-Takwir",
    "titleAr": "التكوير",
    "titleEn": "The Overthrowing",
    "index": "081",
    "pages": "550",
    "page": "586",
    "start": 5800,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_29"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 19,
    "revelationOrder": 82,
    "rukus": 1,
    "title": "Al-Infitar",
    "titleAr": "الإنفطار",
    "titleEn": "The Cleaving",
    "index": "082",
    "pages": "551",
    "page": "587",
    "start": 5829,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_19"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 36,
    "revelationOrder": 86,
    "rukus": 1,
    "title": "Al-Mutaffifin",
    "titleAr": "المطففين",
    "titleEn": "Defrauding",
    "index": "083",
    "pages": "552",
    "page": "587",
    "start": 5848,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_36"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 25,
    "revelationOrder": 83,
    "rukus": 1,
    "title": "Al-Inshiqaq",
    "titleAr": "الإنشقاق",
    "titleEn": "The Splitting Open",
    "index": "084",
    "pages": "553",
    "page": "589",
    "start": 5884,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_25"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 22,
    "revelationOrder": 27,
    "rukus": 1,
    "title": "Al-Buruj",
    "titleAr": "البروج",
    "titleEn": "The Constellations",
    "index": "085",
    "pages": "554",
    "page": "590",
    "start": 5909,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_22"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 17,
    "revelationOrder": 36,
    "rukus": 1,
    "title": "At-Tariq",
    "titleAr": "الطارق",
    "titleEn": "The Morning Star",
    "index": "086",
    "pages": "555",
    "page": "591",
    "start": 5931,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_17"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 19,
    "revelationOrder": 8,
    "rukus": 1,
    "title": "Al-Ala",
    "titleAr": "الأعلى",
    "titleEn": "The Most High",
    "index": "087",
    "pages": "556",
    "page": "591",
    "start": 5948,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_19"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 26,
    "revelationOrder": 68,
    "rukus": 1,
    "title": "Al-Ghashiyah",
    "titleAr": "الغاشية",
    "titleEn": "The Overwhelming",
    "index": "088",
    "pages": "556",
    "page": "592",
    "start": 5967,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_26"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 30,
    "revelationOrder": 10,
    "rukus": 1,
    "title": "Al-Fajr",
    "titleAr": "الفجر",
    "titleEn": "The Dawn",
    "index": "089",
    "pages": "557",
    "page": "593",
    "start": 5993,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_30"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 20,
    "revelationOrder": 35,
    "rukus": 1,
    "title": "Al-Balad",
    "titleAr": "البلد",
    "titleEn": "The City",
    "index": "090",
    "pages": "559",
    "page": "594",
    "start": 6023,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_20"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 15,
    "revelationOrder": 26,
    "rukus": 1,
    "title": "Ash-Shams",
    "titleAr": "الشمس",
    "titleEn": "The Sun",
    "index": "091",
    "pages": "559",
    "page": "595",
    "start": 6043,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_15"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 21,
    "revelationOrder": 9,
    "rukus": 1,
    "title": "Al-Lail",
    "titleAr": "الليل",
    "titleEn": "The Night",
    "index": "092",
    "pages": "560",
    "page": "595",
    "start": 6058,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_21"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 11,
    "revelationOrder": 11,
    "rukus": 1,
    "title": "Ad-Duha",
    "titleAr": "الضحى",
    "titleEn": "The Morning Hours",
    "index": "093",
    "pages": "561",
    "page": "596",
    "start": 6079,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_11"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 8,
    "revelationOrder": 12,
    "rukus": 1,
    "title": "Ash-Sharh",
    "titleAr": "الشرح",
    "titleEn": "The Consolation",
    "index": "094",
    "pages": "561",
    "page": "596",
    "start": 6090,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_8"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 8,
    "revelationOrder": 28,
    "rukus": 1,
    "title": "At-Tin",
    "titleAr": "التين",
    "titleEn": "The Fig",
    "index": "095",
    "pages": "562",
    "page": "597",
    "start": 6098,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_8"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 19,
    "revelationOrder": 1,
    "rukus": 1,
    "title": "Al-Alaq",
    "titleAr": "العلق",
    "titleEn": "The Clot",
    "index": "096",
    "pages": "562",
    "page": "597",
    "start": 6106,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_19"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 5,
    "revelationOrder": 25,
    "rukus": 1,
    "title": "Al-Qadr",
    "titleAr": "القدر",
    "titleEn": "The Power, Fate",
    "index": "097",
    "pages": "563",
    "page": "598",
    "start": 6125,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_5"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 8,
    "revelationOrder": 100,
    "rukus": 1,
    "title": "Al-Bayinah",
    "titleAr": "البينة",
    "titleEn": "The Evidence",
    "index": "098",
    "pages": "563",
    "page": "598",
    "start": 6130,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_8"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 8,
    "revelationOrder": 93,
    "rukus": 1,
    "title": "Az-Zalzalah",
    "titleAr": "الزلزلة",
    "titleEn": "The Earthquake",
    "index": "099",
    "pages": "564",
    "page": "599",
    "start": 6138,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_8"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 11,
    "revelationOrder": 14,
    "rukus": 1,
    "title": "Al-Adiyat",
    "titleAr": "العاديات",
    "titleEn": "The Chargers",
    "index": "100",
    "pages": "564",
    "page": "599",
    "start": 6146,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_11"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 11,
    "revelationOrder": 30,
    "rukus": 1,
    "title": "Al-Qariah",
    "titleAr": "القارعة",
    "titleEn": "The Calamity",
    "index": "101",
    "pages": "565",
    "page": "600",
    "start": 6157,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_11"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 8,
    "revelationOrder": 16,
    "rukus": 1,
    "title": "Al-Takathur",
    "titleAr": "التكاثر",
    "titleEn": "Competition",
    "index": "102",
    "pages": "565",
    "page": "600",
    "start": 6168,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_8"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 3,
    "revelationOrder": 13,
    "rukus": 1,
    "title": "Al-Asr",
    "titleAr": "العصر",
    "titleEn": "The Declining Day, Epoch",
    "index": "103",
    "pages": "566",
    "page": "601",
    "start": 6176,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_3"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 9,
    "revelationOrder": 32,
    "rukus": 1,
    "title": "Al-Humazah",
    "titleAr": "الهمزة",
    "titleEn": "The Traducer",
    "index": "104",
    "pages": "566",
    "page": "601",
    "start": 6179,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_9"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 5,
    "revelationOrder": 19,
    "rukus": 1,
    "title": "Al-Fil",
    "titleAr": "الفيل",
    "titleEn": "The Elephant",
    "index": "105",
    "pages": "566",
    "page": "601",
    "start": 6188,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_5"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 4,
    "revelationOrder": 29,
    "rukus": 1,
    "title": "Quraish",
    "titleAr": "قريش",
    "titleEn": "Quraysh",
    "index": "106",
    "pages": "567",
    "page": "602",
    "start": 6193,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_4"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 7,
    "revelationOrder": 17,
    "rukus": 1,
    "title": "Al-Ma'un",
    "titleAr": "الماعون",
    "titleEn": "Almsgiving",
    "index": "107",
    "pages": "567",
    "page": "602",
    "start": 6197,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_7"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 3,
    "revelationOrder": 15,
    "rukus": 1,
    "title": "Al-Kauthar",
    "titleAr": "الكوثر",
    "titleEn": "Abundance",
    "index": "108",
    "pages": "567",
    "page": "602",
    "start": 6204,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_3"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 6,
    "revelationOrder": 18,
    "rukus": 1,
    "title": "Al-Kafirun",
    "titleAr": "الكافرون",
    "titleEn": "The Disbelievers",
    "index": "109",
    "pages": "568",
    "page": "603",
    "start": 6207,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_6"}
      }
    ]
  },
  {
    "place": "Medina",
    "type": "Madaniyah",
    "count": 3,
    "revelationOrder": 114,
    "rukus": 1,
    "title": "An-Nasr",
    "titleAr": "النصر",
    "titleEn": "Divine Support",
    "index": "110",
    "pages": "568",
    "page": "603",
    "start": 6213,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_3"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 5,
    "revelationOrder": 6,
    "rukus": 1,
    "title": "Al-Masad",
    "titleAr": "المسد",
    "titleEn": "The Palm Fibre",
    "index": "111",
    "pages": "568",
    "page": "603",
    "start": 6216,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_5"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 4,
    "revelationOrder": 22,
    "rukus": 1,
    "title": "Al-Ikhlas",
    "titleAr": "الإخلاص",
    "titleEn": "Sincerity",
    "index": "112",
    "pages": "569",
    "page": "604",
    "start": 6221,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_4"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 5,
    "revelationOrder": 20,
    "rukus": 1,
    "title": "Al-Falaq",
    "titleAr": "الفلق",
    "titleEn": "The Dawn",
    "index": "113",
    "pages": "569",
    "page": "604",
    "start": 6225,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_5"}
      }
    ]
  },
  {
    "place": "Mecca",
    "type": "Makkiyah",
    "count": 6,
    "revelationOrder": 21,
    "rukus": 1,
    "title": "An-Nas",
    "titleAr": "الناس",
    "titleEn": "Mankind",
    "index": "114",
    "pages": "569",
    "page": "604",
    "start": 6230,
    "juz": [
      {
        "index": "30",
        "verse": {"start": "verse_1", "end": "verse_6"}
      }
    ]
  }
];

