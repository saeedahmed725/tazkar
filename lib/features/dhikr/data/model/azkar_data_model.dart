class AzkarDataModel {
  final int id;
  final int categoryId;
  final int count;
  final String description;
  final String reference;
  final String zekr;

  AzkarDataModel({
    required this.id,
    required this.categoryId,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  factory AzkarDataModel.fromJson(Map<String, dynamic> json) {
    return AzkarDataModel(
      id: json['id'] as int,
      categoryId: json['category_id'] as int,
      count: json['count'] as int,
      description: json['description'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
      zekr: json['zekr'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'count': count,
      'description': description,
      'reference': reference,
      'zekr': zekr,
    };
  }
}
