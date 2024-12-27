import 'package:amozeshyar/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

const String loginPage = '/loginPage';

class PageRoute {
  static Route<dynamic> route(RouteSettings setting) {
    switch (setting.name) {
      case loginPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: loginPage),
          builder: (_) => LoginPage(),
        );

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: loginPage),
          builder: (_) => LoginPage(),
        );
    }
  }
}
