import 'dart:ui';

import 'package:equatable/equatable.dart';

class AccentColorEntity extends Equatable {
  final String title;
  final Color color;

  const AccentColorEntity({required this.title, required this.color});

  @override
  List<Object?> get props => [title, color];
}
