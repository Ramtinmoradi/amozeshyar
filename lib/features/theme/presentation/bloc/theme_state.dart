part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitialState extends ThemeState {}

final class ThemeLoadingState extends ThemeState {}

final class ThemeErrorState extends ThemeState {
  const ThemeErrorState({required this.message});

  final String message;
}

final class ChangeThemeSuccessfulState extends ThemeState {
  const ChangeThemeSuccessfulState({required this.theme});

  final ThemeData theme;
}

final class LoadThemeSuccessfulState extends ThemeState {
  const LoadThemeSuccessfulState({required this.theme});

  final ThemeData theme;
}
