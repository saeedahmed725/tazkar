class AzkarCategoryModel {
  final int categoryId;
  final String categoryTitle;

  AzkarCategoryModel({required this.categoryId, required this.categoryTitle});

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) {
    return AzkarCategoryModel(
      categoryId: json['category_id'] as int,
      categoryTitle: json['category_title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'category_id': categoryId, 'category_title': categoryTitle};
  }
}
