import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required isdarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isdarkTheme ? Colors.black : Colors.white,
      cardColor: isdarkTheme ? Colors.white : Colors.black,
      brightness: isdarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isdarkTheme ? Colors.black : Colors.white,
        iconTheme:
            IconThemeData(color: isdarkTheme ? Colors.red : Colors.purple),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: isdarkTheme ? Colors.white : Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2),
        ),
      ),
    );
  }
}
