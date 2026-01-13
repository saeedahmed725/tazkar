part of 'evaluate_recitation_bloc.dart';

@immutable
sealed class EvaluateRecitationEvent {}

final class EvaluateRecitationStart extends EvaluateRecitationEvent {}

final class EvaluateRecitationEnd extends EvaluateRecitationEvent {
  final int pageNumber;

  EvaluateRecitationEnd({
    required this.pageNumber,
  });
}

final class EvaluateRecitation extends EvaluateRecitationEvent {
  final int pageNumber;
  final File file;

  EvaluateRecitation({
    required this.pageNumber,
    required this.file,
  });
}
