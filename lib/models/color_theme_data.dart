import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData greenTheme = ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      // accentColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));
  final ThemeData redTheme = ThemeData(
      primaryColor: Colors.red,
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      // accentColor: Colors.red,
      appBarTheme: const AppBarTheme(color: Colors.red),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));

  ThemeData _selectedThemeData = ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      // accentColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));
  void switchTheme(bool selected) {
    _selectedThemeData = selected ? greenTheme : redTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
