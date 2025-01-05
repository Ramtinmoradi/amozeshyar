import 'package:amozeshyar/features/authentication/presentation/pages/login_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/financial_situation_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/home_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/profile_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/search_unit_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/semester_report_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/semester_status_page.dart';
import 'package:amozeshyar/features/student/presentation/pages/unit_selection_page.dart';
import 'package:flutter/material.dart';

const String loginPage = '/loginPage';
const String homePage = '/homePage';
const String searchUnitPage = '/searchUnitPage';
const String semesterReportPage = '/semesterReportPage';
const String semesterStatusPage = '/semesterStatusPage';
const String unitSelectionPage = '/unitSelectionPage';
const String financialSituationPage = '/financialSituationPage';
const String profilePage = '/profilePage';

class PageRoute {
  static Route<dynamic> route(RouteSettings setting) {
    switch (setting.name) {
      case loginPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: loginPage),
          builder: (_) => LoginPage(),
        );
      case homePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: homePage),
          builder: (_) => HomePage(),
        );
      case searchUnitPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: searchUnitPage),
          builder: (_) => SearchUnitPage(),
        );
      case semesterReportPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: semesterReportPage),
          builder: (_) => SemesterReportPage(),
        );
      case semesterStatusPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: semesterStatusPage),
          builder: (_) => SemesterStatusPage(),
        );
      case unitSelectionPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: unitSelectionPage),
          builder: (_) => UnitSelectionPage(),
        );
      case financialSituationPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: financialSituationPage),
          builder: (_) => FinancialSituationPage(),
        );
      case profilePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: profilePage),
          builder: (_) => ProfilePage(),
        );

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: loginPage),
          builder: (_) => LoginPage(),
        );
    }
  }
}
