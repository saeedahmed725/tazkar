import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/classes/colorful_safe_area.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/features/dhikr/data/datasource/dhikr_local_datasource.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_category_model.dart';
import 'package:tazkar/features/dhikr/data/repo/dhikr_repo_impl.dart';
import 'package:go_router/go_router.dart' as go_router;

class DhikrCategoriesScreen extends StatefulWidget {
  const DhikrCategoriesScreen({super.key});

  @override
  State<DhikrCategoriesScreen> createState() => _DhikrCategoriesScreenState();
}

class _DhikrCategoriesScreenState extends State<DhikrCategoriesScreen> {
  late final DhikrRepoImpl _dhikrRepo;
  List<AzkarCategoryModel> _categories = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _dhikrRepo = DhikrRepoImpl(local: DhikrLocalDataSource());
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await _dhikrRepo.getAzkarCategories();

    result.data.fold(
      (failure) {
        setState(() {
          _isLoading = false;
          _errorMessage = failure.message;
        });
      },
      (categories) {
        setState(() {
          _categories = categories;
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: context.primaryColor,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.starsIconsBackground),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => go_router.GoRouter.of(context).pop(),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'azkar'.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.kSAFonts,
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : _errorMessage != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.white,
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _errorMessage!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _loadCategories,
                                child: Text('retry'.tr()),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            return _buildCategoryCard(category);
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(AzkarCategoryModel category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        border: Border.all(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            go_router.GoRouter.of(
              context,
            ).pushNamed(AppRoutes.dhikrDetails, extra: category);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.primaryColor.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${category.categoryId}',
                      style: TextStyle(
                        color: context.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.kSAFonts,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    category.categoryTitle,
                    style: TextStyle(
                      color: context.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.kSAFonts,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.primaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
