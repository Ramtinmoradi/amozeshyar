import 'dart:async';

import 'package:amozeshyar/core/usecases/usecase.dart';
import 'package:amozeshyar/features/theme/domain/usecases/change_theme_usecase.dart';
import 'package:amozeshyar/features/theme/domain/usecases/load_theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.loadThemeUseCase,
    required this.changeThemeUseCase,
  }) : super(ThemeInitialState()) {
    on<ThemeEvent>((event, emit) async {
      if (event is LoadThemeEvent) {
        await _onLoadThemeEvent(event, emit);
      } else if (event is ChangeThemeEvent) {
        await _onChangeThemeEvent(event, emit);
      }
    });
  }
  final LoadThemeUseCase loadThemeUseCase;
  final ChangeThemeUseCase changeThemeUseCase;

  FutureOr<void> _onLoadThemeEvent(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeLoadingState());
    final result = await loadThemeUseCase.call(NoParams());
    emit(
      result.fold(
        (error) => ThemeErrorState(message: error.message),
        (theme) => LoadThemeSuccessfulState(theme: theme),
      ),
    );
  }

  FutureOr<void> _onChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeLoadingState());
    final result = await changeThemeUseCase.call(NoParams());
    emit(
      result.fold(
        (error) => ThemeErrorState(message: error.message),
        (theme) => ChangeThemeSuccessfulState(theme: theme),
      ),
    );
  }
}
