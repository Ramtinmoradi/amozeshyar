import 'dart:ui';

import 'package:amozeshyar/core/errors/error.dart';
import 'package:amozeshyar/core/errors/exceptions.dart';
import 'package:amozeshyar/features/theme/data/datasources/theme_local_datasource.dart';
import 'package:amozeshyar/features/theme/domain/entities/theme_entity.dart';
import 'package:amozeshyar/features/theme/domain/repositories/theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({required this.localDatasource});

  final ThemeLocalDataSource localDatasource;

  @override
  Future<Either<Failure, ThemeData>> changeTheme() async {
    try {
      final isLightThemeMode = await localDatasource.loadTheme();
      if (isLightThemeMode) {
        await localDatasource.changeTheme(false);
        return Right(ThemeEntity.darkTheme);
      } else {
        await localDatasource.changeTheme(true);
        return Right(ThemeEntity.lightTheme);
      }
    } on Exception catch (_) {
      return Right(ThemeEntity.darkTheme);
    }
  }

  @override
  Future<Either<Failure, ThemeData>> loadTheme() async {
    try {
      final isLightThemeMode = await localDatasource.loadTheme();
      if (isLightThemeMode) {
        return Right(ThemeEntity.lightTheme);
      } else {
        return Right(ThemeEntity.darkTheme);
      }
    } on HiveException {
      final isLightMode = PlatformDispatcher.instance.platformBrightness == Brightness.light;
      if (isLightMode) {
        await localDatasource.changeTheme(true);
        return Right(ThemeEntity.lightTheme);
      } else {
        await localDatasource.changeTheme(false);
        return Right(ThemeEntity.darkTheme);
      }
    }
  }
}
