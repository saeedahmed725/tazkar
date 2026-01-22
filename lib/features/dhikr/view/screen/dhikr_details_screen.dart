import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tazkar/core/classes/colorful_safe_area.dart';
import 'package:tazkar/core/constants/app_colors.dart';
import 'package:tazkar/core/constants/app_fonts.dart';
import 'package:tazkar/core/constants/app_assets.dart';
import 'package:tazkar/features/dhikr/data/datasource/dhikr_local_datasource.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_category_model.dart';
import 'package:tazkar/features/dhikr/data/model/azkar_data_model.dart';
import 'package:tazkar/features/dhikr/data/repo/dhikr_repo_impl.dart';
import 'package:go_router/go_router.dart' as go_router;

class DhikrDetailsScreen extends StatefulWidget {
  final AzkarCategoryModel category;

  const DhikrDetailsScreen({super.key, required this.category});

  @override
  State<DhikrDetailsScreen> createState() => _DhikrDetailsScreenState();
}

class _DhikrDetailsScreenState extends State<DhikrDetailsScreen> {
  late final DhikrRepoImpl _dhikrRepo;
  late final PageController _pageController;
  List<AzkarDataModel> _azkarList = [];
  Map<int, int> _counters = {};
  int _currentIndex = 0;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _dhikrRepo = DhikrRepoImpl(local: DhikrLocalDataSource());
    _pageController = PageController();
    _loadAzkar();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadAzkar() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await _dhikrRepo.getAzkarDataByCategory(
      categoryId: widget.category.categoryId,
    );

    result.data.fold(
      (failure) {
        setState(() {
          _isLoading = false;
          _errorMessage = failure.message;
        });
      },
      (azkarList) {
        setState(() {
          _azkarList = azkarList;
          // Initialize counters
          for (var azkar in azkarList) {
            _counters[azkar.id] = azkar.count;
          }
          _isLoading = false;
        });
      },
    );
  }

  void _decrementCounter(int id) {
    setState(() {
      if (_counters[id] != null && _counters[id]! > 0) {
        _counters[id] = _counters[id]! - 1;
      }
    });
  }

  void _resetCounter(int id, int originalCount) {
    setState(() {
      _counters[id] = originalCount;
    });
  }

  double _calculateOverallProgress() {
    if (_azkarList.isEmpty) return 0.0;

    int totalCompleted = 0;
    int totalCount = 0;

    for (var item in _azkarList) {
      final itemCount = _counters[item.id] ?? item.count;
      totalCompleted += (item.count - itemCount);
      totalCount += item.count;
    }

    return totalCount > 0 ? totalCompleted / totalCount : 0.0;
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
                // Category Banner Header
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      // Back Button
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => go_router.GoRouter.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 12),
                      // Category Title
                      Expanded(
                        child: Text(
                          widget.category.categoryTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.kSAFonts,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 44,
                      ), // Balance the back button width
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
                                onPressed: _loadAzkar,
                                child: Text('retry'.tr()),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            // Horizontal Slider for Dhikr Cards
                            Expanded(
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                itemCount: _azkarList.length,
                                itemBuilder: (context, index) {
                                  final azkar = _azkarList[index];
                                  return _buildDhikrCard(azkar);
                                },
                              ),
                            ),
                            // Static Counter Section at Bottom
                            if (_azkarList.isNotEmpty)
                              _buildStaticCounter(_azkarList[_currentIndex]),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDhikrCard(AzkarDataModel azkar) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        border: Border.all(
          color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dhikr Text
            Text(
              azkar.zekr,
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.kSAFonts,
                height: 2.0,
              ),
              textAlign: TextAlign.center,
            ),
            if (azkar.reference.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                azkar.reference,
                style: TextStyle(
                  color: context.primaryColor.withValues(alpha: 0.7),
                  fontSize: 15,
                  fontFamily: AppFonts.kSAFonts,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (azkar.description.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: context.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  azkar.description,
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: 14,
                    fontFamily: AppFonts.kSAFonts,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStaticCounter(AzkarDataModel azkar) {
    final currentCount = _counters[azkar.id] ?? azkar.count;
    final isCompleted = currentCount == 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        border: Border(
          top: BorderSide(
            color: AppColors.kSecondaryColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: _calculateOverallProgress(),
              minHeight: 8,
              backgroundColor: context.primaryColor.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.kSecondaryColor,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Progress Text Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'من $currentCount',
                style: TextStyle(
                  color: context.primaryColor.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontFamily: AppFonts.kSAFonts,
                ),
              ),
              Text(
                'الذكر ${_currentIndex + 1} من ${_azkarList.length}',
                style: TextStyle(
                  color: context.primaryColor.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontFamily: AppFonts.kSAFonts,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Circular Progress Counter
          GestureDetector(
            onTap: () => _decrementCounter(azkar.id),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Decorative Background Circle
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kSecondaryColor.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                ),
                // Progress Circle
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: isCompleted
                        ? 1.0
                        : (azkar.count - currentCount) / azkar.count,
                    strokeWidth: 8,
                    backgroundColor: context.primaryColor.withValues(
                      alpha: 0.2,
                    ),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isCompleted ? Colors.green : AppColors.kSecondaryColor,
                    ),
                  ),
                ),
                // Center Content
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: context.primaryColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 48,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'تم',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.kSAFonts,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '$currentCount',
                            style: TextStyle(
                              color: context.primaryColor,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.kSAFonts,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Reset Button
          TextButton.icon(
            onPressed: () => _resetCounter(azkar.id, azkar.count),
            icon: Icon(
              Icons.refresh,
              color: context.primaryColor.withValues(alpha: 0.7),
              size: 20,
            ),
            label: Text(
              'إعادة',
              style: TextStyle(
                color: context.primaryColor.withValues(alpha: 0.7),
                fontSize: 14,
                fontFamily: AppFonts.kSAFonts,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
