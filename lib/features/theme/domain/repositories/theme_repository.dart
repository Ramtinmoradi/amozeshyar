import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '/core/errors/error.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeData>> changeTheme();
  Future<Either<Failure, ThemeData>> loadTheme();
}
