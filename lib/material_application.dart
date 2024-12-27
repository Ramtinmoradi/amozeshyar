import 'package:flutter/material.dart';
import '/core/routes/page_route.dart' as router;

class MaterialApplication extends StatefulWidget {
  const MaterialApplication({super.key, required this.themeData});

  final ThemeData? themeData;

  @override
  State<MaterialApplication> createState() => _MyAppState();
}

class _MyAppState extends State<MaterialApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.PageRoute.route,
      initialRoute: router.loginPage,
    );
  }
}
