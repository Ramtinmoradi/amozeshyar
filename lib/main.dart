import 'package:amozeshyar/core/responsive/sizes.dart';
import 'package:amozeshyar/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:amozeshyar/material_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/config/service_locator.dart' as di;
import '/config/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.dependenciesInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return BlocProvider<ThemeBloc>(
              create: (context) => sl<ThemeBloc>()..add(LoadThemeEvent()),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  if (state is LoadThemeSuccessfulState) {
                    return MaterialApplication(themeData: state.theme);
                  } else if (state is ChangeThemeSuccessfulState) {
                    return MaterialApplication(themeData: state.theme);
                  }
                  return const MaterialApplication(themeData: null);
                },
              ),
            );
          },
        );
      },
    );
  }
}
