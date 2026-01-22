import 'package:flutter/material.dart';

import '../../data/enums/calendar_method.dart';
import '../../data/enums/latitude_adjustment_method.dart';
import '../../data/enums/midnight_mode.dart';
import '../../data/enums/prayer_calculation_method.dart';
import '../../data/enums/prayer_school.dart';
import '../../data/enums/shafaq.dart';

class PrayerSettingsView extends StatefulWidget {
  const PrayerSettingsView({super.key});

  @override
  State<PrayerSettingsView> createState() => _PrayerSettingsViewState();
}

class _PrayerSettingsViewState extends State<PrayerSettingsView> {
  PrayerCalculationMethod _calculationMethod = PrayerCalculationMethod.egyptian;
  PrayerSchool _school = PrayerSchool.hanafi;
  CalendarMethod _calendarMethod = CalendarMethod.uaq;
  MidnightMode _midnightMode = MidnightMode.standard;
  Shafaq _shafaq = Shafaq.general;
  LatitudeAdjustmentMethod? _latitudeAdjustment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [theme.scaffoldBackgroundColor, theme.scaffoldBackgroundColor]
              : [Colors.grey[50]!, Colors.white],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _buildSectionHeader('Calculation Method', Icons.calculate_rounded),
          _buildSettingCard(
            title: 'Prayer Calculation',
            subtitle: _calculationMethod.label,
            icon: Icons.mosque_outlined,
            gradient: LinearGradient(
              colors: [theme.primaryColor.withOpacity(0.1), theme.primaryColor.withOpacity(0.05)],
            ),
            onTap: () => _showCalculationMethodPicker(),
          ),
          const SizedBox(height: 12),
          _buildSettingCard(
            title: 'Juristic School',
            subtitle: _school.label,
            icon: Icons.menu_book_rounded,
            gradient: LinearGradient(
              colors: [Colors.teal.withOpacity(0.1), Colors.teal.withOpacity(0.05)],
            ),
            onTap: () => _showSchoolPicker(),
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('Advanced Settings', Icons.tune_rounded),
          _buildSettingCard(
            title: 'Calendar Method',
            subtitle: _calendarMethod.label,
            icon: Icons.event_note_rounded,
            gradient: LinearGradient(
              colors: [Colors.deepPurple.withOpacity(0.1), Colors.deepPurple.withOpacity(0.05)],
            ),
            onTap: () => _showCalendarMethodPicker(),
          ),
          const SizedBox(height: 12),
          _buildSettingCard(
            title: 'Midnight Mode',
            subtitle: _midnightMode.label,
            icon: Icons.nightlight_round,
            gradient: LinearGradient(
              colors: [Colors.indigo.withOpacity(0.1), Colors.indigo.withOpacity(0.05)],
            ),
            onTap: () => _showMidnightModePicker(),
          ),
          const SizedBox(height: 12),
          _buildSettingCard(
            title: 'Shafaq (Twilight)',
            subtitle: _shafaq.label,
            icon: Icons.wb_twilight_rounded,
            gradient: LinearGradient(
              colors: [Colors.orange.withOpacity(0.1), Colors.orange.withOpacity(0.05)],
            ),
            onTap: () => _showShafaqPicker(),
          ),
          const SizedBox(height: 12),
          _buildSettingCard(
            title: 'Latitude Adjustment',
            subtitle: _latitudeAdjustment?.label ?? 'None',
            icon: Icons.public_rounded,
            gradient: LinearGradient(
              colors: [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.05)],
            ),
            onTap: () => _showLatitudeAdjustmentPicker(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCalculationMethodPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          expand: false,
          builder: (context, scrollController) => Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  children: [
                    Icon(Icons.mosque_outlined, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 12),
                    Text(
                      'Calculation Method',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: PrayerCalculationMethod.values.length,
                  itemBuilder: (context, index) {
                    final method = PrayerCalculationMethod.values[index];
                    final isSelected = _calculationMethod == method;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).primaryColor.withOpacity(0.3)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: RadioListTile<PrayerCalculationMethod>(
                        title: Text(
                          method.label,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                        value: method,
                        groupValue: _calculationMethod,
                        activeColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onChanged: (value) {
                          setState(() => _calculationMethod = value!);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showSchoolPicker() => _showEnumPicker<PrayerSchool>(
    title: 'Juristic School',
    icon: Icons.menu_book_rounded,
    values: PrayerSchool.values,
    currentValue: _school,
    onSelected: (value) => setState(() => _school = value),
    getLabel: (value) => value.label,
  );

  void _showCalendarMethodPicker() => _showEnumPicker<CalendarMethod>(
    title: 'Calendar Method',
    icon: Icons.event_note_rounded,
    values: CalendarMethod.values,
    currentValue: _calendarMethod,
    onSelected: (value) => setState(() => _calendarMethod = value),
    getLabel: (value) => value.label,
  );

  void _showMidnightModePicker() => _showEnumPicker<MidnightMode>(
    title: 'Midnight Mode',
    icon: Icons.nightlight_round,
    values: MidnightMode.values,
    currentValue: _midnightMode,
    onSelected: (value) => setState(() => _midnightMode = value),
    getLabel: (value) => value.label,
  );

  void _showShafaqPicker() => _showEnumPicker<Shafaq>(
    title: 'Shafaq (Twilight)',
    icon: Icons.wb_twilight_rounded,
    values: Shafaq.values,
    currentValue: _shafaq,
    onSelected: (value) => setState(() => _shafaq = value),
    getLabel: (value) => value.label,
  );

  void _showLatitudeAdjustmentPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.public_rounded, color: Theme.of(context).primaryColor),
            const SizedBox(width: 12),
            const Text('Latitude Adjustment'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogOption<LatitudeAdjustmentMethod?>(
                title: 'None',
                value: null,
                groupValue: _latitudeAdjustment,
                onChanged: (value) {
                  setState(() => _latitudeAdjustment = value);
                  Navigator.pop(context);
                },
              ),
              ...LatitudeAdjustmentMethod.values.map((method) {
                return _buildDialogOption<LatitudeAdjustmentMethod?>(
                  title: method.label,
                  value: method,
                  groupValue: _latitudeAdjustment,
                  onChanged: (value) {
                    setState(() => _latitudeAdjustment = value);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  void _showEnumPicker<T>({
    required String title,
    required IconData icon,
    required List<T> values,
    required T currentValue,
    required Function(T) onSelected,
    required String Function(T) getLabel,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: values.map((value) {
              return _buildDialogOption<T>(
                title: getLabel(value),
                value: value,
                groupValue: currentValue,
                onChanged: (selected) {
                  onSelected(selected as T);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDialogOption<T>({
    required String title,
    required T value,
    required T groupValue,
    required Function(T?) onChanged,
  }) {
    final isSelected = value == groupValue;
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: RadioListTile<T>(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        value: value,
        groupValue: groupValue,
        activeColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onChanged: onChanged,
      ),
    );
  }
}