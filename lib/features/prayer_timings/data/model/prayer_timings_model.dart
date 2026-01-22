class PrayerTimingsModel {
  final int code;
  final String status;
  final Map<String, List<PrayerDay>> data;

  PrayerTimingsModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimingsModel.fromJson(Map<String, dynamic> json) {
    final dataMap = <String, List<PrayerDay>>{};
    (json['data'] as Map<String, dynamic>).forEach((key, value) {
      dataMap[key] = (value as List)
          .map((e) => PrayerDay.fromJson(e as Map<String, dynamic>))
          .toList();
    });

    return PrayerTimingsModel(
      code: json['code'],
      status: json['status'],
      data: dataMap,
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'data': data.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList())),
  };
}

class PrayerDay {
  final Timings timings;
  final PrayerDate date;
  final PrayerMeta meta;

  PrayerDay({required this.timings, required this.date, required this.meta});

  factory PrayerDay.fromJson(Map<String, dynamic> json) => PrayerDay(
    timings: Timings.fromJson(json['timings']),
    date: PrayerDate.fromJson(json['date']),
    meta: PrayerMeta.fromJson(json['meta']),
  );

  Map<String, dynamic> toJson() => {
    'timings': timings.toJson(),
    'date': date.toJson(),
    'meta': meta.toJson(),
  };
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstthird;
  final String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json['Fajr'],
    sunrise: json['Sunrise'],
    dhuhr: json['Dhuhr'],
    asr: json['Asr'],
    sunset: json['Sunset'],
    maghrib: json['Maghrib'],
    isha: json['Isha'],
    imsak: json['Imsak'],
    midnight: json['Midnight'],
    firstthird: json['Firstthird'],
    lastthird: json['Lastthird'],
  );

  Map<String, dynamic> toJson() => {
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Sunset': sunset,
    'Maghrib': maghrib,
    'Isha': isha,
    'Imsak': imsak,
    'Midnight': midnight,
    'Firstthird': firstthird,
    'Lastthird': lastthird,
  };
}

class PrayerDate {
  final String readable;
  final String timestamp;
  final HijriDate hijri;
  final GregorianDate gregorian;

  PrayerDate({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory PrayerDate.fromJson(Map<String, dynamic> json) => PrayerDate(
    readable: json['readable'],
    timestamp: json['timestamp'],
    hijri: HijriDate.fromJson(json['hijri']),
    gregorian: GregorianDate.fromJson(json['gregorian']),
  );

  Map<String, dynamic> toJson() => {
    'readable': readable,
    'timestamp': timestamp,
    'hijri': hijri.toJson(),
    'gregorian': gregorian.toJson(),
  };
}

class HijriDate {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;
  final List<String> adjustedHolidays;
  final String method;

  HijriDate({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
    required this.adjustedHolidays,
    required this.method,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) => HijriDate(
    date: json['date'],
    format: json['format'],
    day: json['day'],
    weekday: Weekday.fromJson(json['weekday']),
    month: Month.fromJson(json['month']),
    year: json['year'],
    designation: Designation.fromJson(json['designation']),
    holidays: json['holidays'] ?? [],
    adjustedHolidays: List<String>.from(json['adjustedHolidays'] ?? []),
    method: json['method'],
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday.toJson(),
    'month': month.toJson(),
    'year': year,
    'designation': designation.toJson(),
    'holidays': holidays,
    'adjustedHolidays': adjustedHolidays,
    'method': method,
  };
}

class GregorianDate {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final bool lunarSighting;

  GregorianDate({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.lunarSighting,
  });

  factory GregorianDate.fromJson(Map<String, dynamic> json) => GregorianDate(
    date: json['date'],
    format: json['format'],
    day: json['day'],
    weekday: Weekday.fromJson(json['weekday']),
    month: Month.fromJson(json['month']),
    year: json['year'],
    designation: Designation.fromJson(json['designation']),
    lunarSighting: json['lunarSighting'],
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday.toJson(),
    'month': month.toJson(),
    'year': year,
    'designation': designation.toJson(),
    'lunarSighting': lunarSighting,
  };
}

class Weekday {
  final String en;
  final String? ar;

  Weekday({required this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      Weekday(en: json['en'], ar: json['ar']);

  Map<String, dynamic> toJson() => {'en': en, 'ar': ar};
}

class Month {
  final int number;
  final String en;
  final String? ar;
  final int? days;

  Month({required this.number, required this.en, this.ar, this.days});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
    number: json['number'],
    en: json['en'],
    ar: json['ar'],
    days: json['days'],
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'en': en,
    'ar': ar,
    'days': days,
  };
}

class Designation {
  final String abbreviated;
  final String expanded;

  Designation({required this.abbreviated, required this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) =>
      Designation(abbreviated: json['abbreviated'], expanded: json['expanded']);

  Map<String, dynamic> toJson() => {
    'abbreviated': abbreviated,
    'expanded': expanded,
  };
}

class PrayerMeta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  PrayerMeta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory PrayerMeta.fromJson(Map<String, dynamic> json) => PrayerMeta(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    timezone: json['timezone'],
    method: Method.fromJson(json['method']),
    latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'],
    midnightMode: json['midnightMode'],
    school: json['school'],
    offset: Offset.fromJson(json['offset']),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'timezone': timezone,
    'method': method.toJson(),
    'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
    'midnightMode': midnightMode,
    'school': school,
    'offset': offset.toJson(),
  };
}

class Method {
  final int id;
  final String name;
  final Map<String, int> params;
  final Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
    id: (json['id'] as num).toInt(),
    name: json['name'],
    params: (json['params'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(key, (value as num).round()),
    ),
    location: Location.fromJson(json['location']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'params': params,
    'location': location.toJson(),
  };
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };
}

class Offset {
  final int imsak;
  final int fajr;
  final int sunrise;
  final int dhuhr;
  final int asr;
  final int sunset;
  final int maghrib;
  final int isha;
  final int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
    imsak: json['Imsak'],
    fajr: json['Fajr'],
    sunrise: json['Sunrise'],
    dhuhr: json['Dhuhr'],
    asr: json['Asr'],
    sunset: json['Sunset'],
    maghrib: json['Maghrib'],
    isha: json['Isha'],
    midnight: json['Midnight'],
  );

  Map<String, dynamic> toJson() => {
    'Imsak': imsak,
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Sunset': sunset,
    'Maghrib': maghrib,
    'Isha': isha,
    'Midnight': midnight,
  };
}
