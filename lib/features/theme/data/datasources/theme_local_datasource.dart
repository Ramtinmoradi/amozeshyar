import 'package:dartz/dartz.dart';

import '/core/utils/hive_util.dart';
import '/core/consts/hive_keys.dart';

abstract class ThemeLocalDataSource {
  Future<Unit> changeTheme(bool isLightMode);
  Future<bool> loadTheme();
}

class ThemeLocalDatasourceImpl implements ThemeLocalDataSource {
  @override
  Future<Unit> changeTheme(bool isLightMode) async {
    await saveToHive(HiveKeys.theme, isLightMode);
    return unit;
  }

  @override
  Future<bool> loadTheme() async => await loadFromHive(HiveKeys.theme);
}
