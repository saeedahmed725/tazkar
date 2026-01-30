part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode mode;
  final AccentColorEntity accentColor;

  const ThemeState({required this.mode, required this.accentColor});

  ThemeState copyWith({ThemeMode? mode, AccentColorEntity? accentColor}) {
    return ThemeState(
      mode: mode ?? this.mode,
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  List<Object?> get props => [mode, accentColor];
}
