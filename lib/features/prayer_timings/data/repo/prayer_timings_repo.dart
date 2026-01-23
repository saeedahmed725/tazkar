import 'dart:async';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tazkar/core/utils/errors/exceptions.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/core/utils/helpers/shared_pref.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_query.dart';
import 'package:tazkar/features/prayer_timings/data/model/prayer_timings_model.dart';

import '../../../../core/constants/app_shared_keys.dart';
import '../datasource/prayer_timings_datasource.dart';
import '../datasource/prayer_timings_local_datasource.dart';
import '../enums/calendar_method.dart';
import '../enums/latitude_adjustment_method.dart';
import '../enums/midnight_mode.dart';
import '../enums/prayer_calculation_method.dart';
import '../enums/prayer_school.dart';
import '../enums/shafaq.dart';

class PrayerTimingsRepo {
  final PrayerTimingsDatasource _remote;
  final PrayerTimingsLocalDatasource _local;

  PrayerTimingsRepo({
    required PrayerTimingsDatasource remote,
    required PrayerTimingsLocalDatasource local,
  }) : _remote = remote,
       _local = local;

  String address = 'Cairo, Egypt';

  String get fallbackAddress =>
      SharedPrefs.getString(AppSharedKeys.fallbackAddress);

  void setFallbackAddress(String address) =>
      SharedPrefs.setString(AppSharedKeys.fallbackAddress, address);

  PrayerQuery getPrayerQuery() {
    final calendarMethod = CalendarMethod.fromName(
      SharedPrefs.getString(AppSharedKeys.prayerCalendarMethod),
    );
    final method = PrayerCalculationMethod.fromName(
      SharedPrefs.getString(AppSharedKeys.prayerCalculationMethod),
    );
    final latitudeAdjustmentMethod = LatitudeAdjustmentMethod.fromName(
      SharedPrefs.getString(AppSharedKeys.latitudeAdjustmentMethod),
    );
    final school = PrayerSchool.fromName(
      SharedPrefs.getString(AppSharedKeys.prayerSchool),
    );
    final midnightMode = MidnightMode.fromName(
      SharedPrefs.getString(AppSharedKeys.prayerMidnightMode),
    );
    final shafaq = Shafaq.fromName(
      SharedPrefs.getString(AppSharedKeys.prayerShafaq),
    );

    return PrayerQuery(
      year: DateTime.now().year,
      address: fallbackAddress,
      calendarMethod: calendarMethod,
      method: method,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
      school: school,
      midnightMode: midnightMode,
      shafaq: shafaq,
    );
  }

  String? _formatAddress(Placemark? placemark) {
    if (placemark == null) return null;

    final parts =
        [
              placemark.subAdministrativeArea,
              placemark.administrativeArea,
              placemark.country,
            ]
            .whereType<String>()
            .map((part) => part.trim())
            .where((part) => part.isNotEmpty)
            .toList();

    if (parts.isEmpty) return null;
    return parts.join(', ');
  }

  Future<PrayerQuery> _resolveLocation({bool shouldRefresh = false}) async {
    try {
      if (!shouldRefresh && fallbackAddress.isNotEmpty) {
        return getPrayerQuery();
      }

      var permission = await Geolocator.checkPermission();
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (fallbackAddress.isNotEmpty) {
          return getPrayerQuery();
        }
        throw LocalException(
          'Location services are disabled.',
          code: LocalFailure.LOCATION_SETTINGS_ERROR_CODE,
        );
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        if (fallbackAddress.isNotEmpty) {
          return getPrayerQuery();
        }
        throw LocalException(
          'Location permission denied',
          code: LocalFailure.LOCATION_ERROR_CODE,
        );
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 6),
        ),
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final address = _formatAddress(placemarks.firstOrNull);
      if (address != null && address.isNotEmpty) {
        setFallbackAddress(address);
      }

      return getPrayerQuery().copyWith(address: address);
    } on TimeoutException catch (e) {
      setFallbackAddress(address);
      return getPrayerQuery().copyWith(
        address: fallbackAddress.isNotEmpty ? fallbackAddress : address,
      );
    } catch (e) {
      throw LocalException(
        'Failed to resolve location/address: $e',
        code: LocalFailure.LOCATION_ERROR_CODE,
      );
    }
  }

  Future<Result<PrayerTimingsModel>> getPrayerTimings({
    bool shouldRefresh = false,
  }) {
    return Failure.handleOperation(
      operation: () async {
        PrayerQuery query = await _resolveLocation(
          shouldRefresh: shouldRefresh,
        );

        log('Using provided address: ${query.address}');
        final cached = await _local.getCachedCalendar(query);
        if (cached != null) return cached;

        final remote = await _remote.getAnnualPrayerCalendar(
          year: query.year,
          address: query.address,
          calendarMethod: query.calendarMethod,
          latitudeAdjustmentMethod: query.latitudeAdjustmentMethod,
          method: query.method,
          midnightMode: query.midnightMode,
          school: query.school,
          shafaq: query.shafaq,
          tune: query.tune,
        );

        await _local.cacheCalendar(query: query, model: remote);
        return remote;
      },
      errorMessage: "Failed to get the prayer timings",
    );
  }
}
