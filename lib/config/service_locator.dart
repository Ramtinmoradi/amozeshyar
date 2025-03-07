import 'dart:io';

import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/features/student/data/datasource/student_local_datasource.dart';
import 'package:amozeshyar/features/student/data/repositories/student_repository_impl.dart';
import 'package:amozeshyar/features/student/domain/repositories/student_repository.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'service_locator_imports.dart';

final sl = GetIt.instance;

FutureOr<void> dependenciesInjection() async {
  _injectTheme();
  _injectNotification();
  _injectStudent();
  await _injectDatabase();
}

void _injectNotification() {
  sl.registerLazySingleton<ToastNotifier>(() => FlutterToastNotifier());
}

void _injectTheme() {
  // Bloc
  sl.registerFactory(() => ThemeBloc(changeThemeUseCase: sl(), loadThemeUseCase: sl()));
  // Usecases
  sl.registerLazySingleton(() => ChangeThemeUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoadThemeUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(localDatasource: sl()));
  // Datasources
  sl.registerLazySingleton<ThemeLocalDataSource>(() => ThemeLocalDatasourceImpl());
}

FutureOr<void> _injectDatabase() async {
  Directory hiveDbDirectory = Directory('');
  if (Platform.isAndroid || Platform.isIOS) {
    try {
      hiveDbDirectory = await getApplicationDocumentsDirectory();
    } catch (exp) {
      print(exp);
    }
  } else {
    hiveDbDirectory = Directory(
      Directory.current.path,
    );
  }
  if (!await hiveDbDirectory.exists()) {
    Directory(hiveDbDirectory.path).create(recursive: true);
  }

  Hive.init(hiveDbDirectory.path);
}

FutureOr<void> _injectStudent() async {
  sl.registerFactory(() => StudentCubit(studentRepository: sl()));

  sl.registerLazySingleton<StudentRepository>(() => StudentRepositoryImpl(localDatasource: sl()));

  sl.registerLazySingleton<StudentLocalDatasource>(() => StudentLocalDatasource());
}
