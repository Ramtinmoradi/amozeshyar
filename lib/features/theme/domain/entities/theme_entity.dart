import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEntity extends Equatable {
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFF6F7F9),
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    fontFamily: 'IranSans',
    primaryColor: const Color(0xff330099),
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFF6F7F9),
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
    fontFamily: 'IranSans',
    primaryColor: const Color(0xff330099),
  );

  static const TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    titleMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    bodyMedium: TextStyle(
      fontSize: 10.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    labelSmall: TextStyle(
      fontSize: 8.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    titleMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    bodyMedium: TextStyle(
      fontSize: 10.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
    labelSmall: TextStyle(
      fontSize: 8.0,
      fontFamily: 'IranSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff263238),
    ),
  );

  @override
  List<Object?> get props => [lightTheme, darkTheme];
}
