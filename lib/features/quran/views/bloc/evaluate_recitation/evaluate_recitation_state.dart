part of 'evaluate_recitation_bloc.dart';

@immutable
sealed class EvaluateRecitationState {}

final class EvaluateRecitationInitial extends EvaluateRecitationState {}

final class EvaluateRecitationLoading extends EvaluateRecitationState {}
final class EvaluateRecitationStarting extends EvaluateRecitationState {}
final class EvaluateRecitationEnding extends EvaluateRecitationState {}

final class EvaluateRecitationSuccess extends EvaluateRecitationState {
  final List<CorrectionModel> verses;

  EvaluateRecitationSuccess({required this.verses});
}

final class EvaluateRecitationError extends EvaluateRecitationState {
  final String message;

  EvaluateRecitationError(this.message);
}