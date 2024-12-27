import 'package:amozeshyar/core/errors/error.dart';
import 'package:amozeshyar/core/usecases/usecase.dart';
import 'package:amozeshyar/features/theme/domain/repositories/theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ChangeThemeUseCase implements UseCase<ThemeData, NoParams> {
  ChangeThemeUseCase({required this.repository});

  final ThemeRepository repository;

  @override
  Future<Either<Failure, ThemeData>> call(NoParams params) {
    return repository.changeTheme();
  }
}
