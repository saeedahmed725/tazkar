import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/app/app.dart';
import 'package:tazkar/core/services/services.dart';
import 'package:tazkar/core/utils/bloc/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices.instance.init();

  Bloc.observer = AppBlocObserver();
  runApp(const QuranApp());
}
