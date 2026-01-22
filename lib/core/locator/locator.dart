import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tazkar/core/database/app_database.dart';
import 'package:tazkar/features/quran/data/datasource/quran_local_datasource.dart';
import 'package:tazkar/features/splash/view/bloc/quran_global_bloc.dart';

import '../../features/quran/data/datasource/quran_remote_datasource.dart';
import '../../features/quran/data/repo/mushaf_repo_imp.dart';
import '../../features/quran/views/bloc/juz_infos/juz_infos_bloc.dart';
import '../../features/quran/views/bloc/surah_infos/surah_infos_bloc.dart';
import '../../features/quran/views/controller/mushaf_controller.dart';
import '../../features/prayer_timings/data/datasource/prayer_timings_datasource.dart';
import '../../features/prayer_timings/data/datasource/prayer_timings_local_datasource.dart';
import '../../features/prayer_timings/data/repo/prayer_timings_repo.dart';
import '../../features/prayer_timings/view/bloc/prayer_bloc.dart';
import '../network/connectivity.dart';
import '../network/dio_factory.dart';
import '../network/network_client.dart';
import '../quran/global_quran_data.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;
  static final Set<Type> _factories = {}; // track all registered factories

  /// Initialize and register all dependencies
  static void setup() {
    /// core services
    _registerSingleton<NetworkController>(() => NetworkController.instance);
    _registerSingleton<Dio>(() => DioFactory.getDio());
    _registerSingleton<NetworkClient>(() => NetworkClient(DioFactory.getDio()));
    _registerSingleton<AppDatabase>(() => AppDatabase());
    // _registerSingleton<DownloadService>(() => DownloadService(get<Dio>()));
    // _registerSingleton<AppDatabase>(() => AppDatabase());
    _registerSingleton<MushafController>(() => MushafController.instance);
    _registerSingleton<GlobalQuranData>(() => GlobalQuranData.instance);

    /// feat: splash
    _registerFactory<QuranRemoteDatasource>(
      () => QuranRemoteDatasource(client: get<NetworkClient>()),
    );
    _registerFactory<QuranLocalDataSource>(() => QuranLocalDataSource());
    _registerSingleton<MushafRepoImp>(
      () => MushafRepoImp(
        local: get<QuranLocalDataSource>(),
        remote: get<QuranRemoteDatasource>(),
      ),
    );
    _registerFactory<QuranGlobalBloc>(() => QuranGlobalBloc(get<MushafRepoImp>()));
    _registerFactory<SurahInfosBloc>(() => SurahInfosBloc(get<MushafRepoImp>()));
    _registerFactory<JuzInfosBloc>(() => JuzInfosBloc(get<MushafRepoImp>()));

    /// feat: prayer timings
    _registerFactory<PrayerTimingsDatasource>(
      () => PrayerTimingsDatasource(get<NetworkClient>()),
    );
    _registerFactory<PrayerTimingsLocalDatasource>(
      () => PrayerTimingsLocalDatasource(get<AppDatabase>()),
    );
    _registerSingleton<PrayerTimingsRepo>(
      () => PrayerTimingsRepo(
        remote: get<PrayerTimingsDatasource>(),
        local: get<PrayerTimingsLocalDatasource>(),
      ),
    );
    _registerFactory<PrayerBloc>(() => PrayerBloc(get<PrayerTimingsRepo>()));

    log("Setup completed", name: "Service Locator");
  }

  static void _registerSingleton<T extends Object>(T Function() factory) {
    if (!_getIt.isRegistered<T>()) {
      // log("RegisterSingleton => ${T.toString()}", name: "Service Locator");
      _getIt.registerLazySingleton<T>(factory);
    }
  }

  static void _registerFactory<T extends Object>(T Function() factory) {
    if (!_getIt.isRegistered<T>()) {
      log("RegisterFactory => ${T.toString()}", name: "Service Locator");
      _factories.add(T);
      _getIt.registerFactory<T>(factory);
    }
  }

  static T get<T extends Object>() {
    log("Get => ${T.toString()}", name: "Service Locator");
    return _getIt<T>();
  }

  static bool isRegistered<T extends Object>() => _getIt.isRegistered<T>();

  static bool isFactory<T extends Object>() => _factories.contains(T);

  static void release<T extends Object>() {
    if (_getIt.isRegistered<T>() && !isFactory<T>()) {
      log("Release => ${T.toString()}", name: "Service Locator");
      _getIt.unregister<T>();
    } else if (isFactory<T>()) {
      log(
        "Skipped Release (Factory) => ${T.toString()}",
        name: "Service Locator",
      );
    }
  }

  static GetIt getIt() => _getIt;
}

class ServiceConsumer<T extends Object> extends StatefulWidget {
  final Widget Function(BuildContext context, T service) builder;

  const ServiceConsumer({super.key, required this.builder});

  @override
  State<ServiceConsumer<T>> createState() => _ServiceConsumerState<T>();
}

class _ServiceConsumerState<T extends Object>
    extends State<ServiceConsumer<T>> {
  late T service;

  @override
  void initState() {
    super.initState();
    service = ServiceLocator.get<T>();
    log("Init => ${T.toString()}", name: "Service Consumer");
  }

  @override
  void dispose() {
    log("Dispose => ${T.toString()}", name: "Service Consumer");

    // Close Bloc/Cubit if applicable
    if (service is BlocBase) {
      log("Closing Bloc => ${T.toString()}", name: "Service Consumer");
      (service as BlocBase).close();
    }

    // Release only if not a Factory
    ServiceLocator.release<T>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, service);
  }
}

class MultiServiceConsumer extends StatefulWidget {
  final List<Type> blocs;
  final Widget Function(BuildContext context, List<BlocBase>) builder;

  const MultiServiceConsumer({
    super.key,
    required this.blocs,
    required this.builder,
  });

  @override
  State<MultiServiceConsumer> createState() => _MultiServiceConsumerState();
}

class _MultiServiceConsumerState extends State<MultiServiceConsumer> {
  final List<Object> _instances = [];

  @override
  void initState() {
    super.initState();

    for (final type in widget.blocs) {
      final instance = ServiceLocator.getIt().get(type: type);
      _instances.add(instance);

      log("Init => ${type.toString()}", name: "MultiServiceConsumer");
    }
  }

  @override
  void dispose() {
    for (final instance in _instances) {
      final type = instance.runtimeType;

      log("Dispose => ${type.toString()}", name: "MultiServiceConsumer");

      if (instance is BlocBase) {
        log("Closing Bloc => ${type.toString()}", name: "MultiServiceConsumer");
        instance.close();
      }

      ServiceLocator.getIt().unregister(instance: instance);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _instances.cast<BlocBase>());
  }
}
