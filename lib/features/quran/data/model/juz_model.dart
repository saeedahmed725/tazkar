class JuzModel {
  final int jid;
  final String juzName;
  final int juzNum;
  final int pageNo;
  final int ayaNo;
  final String nameEn;
  final int endAya;
  final String searchText;

  JuzModel({
    required this.jid,
    required this.juzName,
    required this.juzNum,
    required this.pageNo,
    required this.ayaNo,
    required this.nameEn,
    required this.endAya,
    required this.searchText,
  });

  // Factory method to create an instance from JSON
  factory JuzModel.fromJson(Map<String, dynamic> json) {
    return JuzModel(
      jid: json['JID'],
      juzName: json['JuzaName'],
      juzNum: json['JuzaNum'],
      pageNo: json['PageNo'],
      ayaNo: json['AyaNo'],
      nameEn: json['name_en'],
      endAya: json['end_aya'],
      searchText: json['SearchText'],
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'jid': jid,
      'juzaName': juzName,
      'juzaNum': juzNum,
      'pageNo': pageNo,
      'ayaNo': ayaNo,
      'nameEn': nameEn,
      'endAya': endAya,
      'searchText': searchText,
    };
  }
}
