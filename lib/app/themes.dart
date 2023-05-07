import 'package:flutter/material.dart';
import 'package:pet_store/utils/fonts.dart';

class LightTheme {
  static ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      shadowColor: Colors.black12,
      canvasColor: Colors.white12,
      cardColor: const Color.fromARGB(203, 255, 255, 255),
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      primaryTextTheme: TextTheme(
        displayLarge: TextStyleFonts.goldmanHeaderDark.copyWith(
            fontSize: 80, fontWeight: FontWeight.w200, letterSpacing: 0),
        displayMedium: TextStyleFonts.isProperties.copyWith(fontSize: 16),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.white,
        background: Colors.white,
        shadow: const Color.fromARGB(50, 0, 0, 0),
      ),
    );
  }
}

class DarkTheme {
  static ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      shadowColor: Colors.white12,
      canvasColor: Colors.black12,
      cardColor: const Color.fromARGB(212, 0, 0, 0),
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      primaryTextTheme: TextTheme(
        displayLarge: TextStyleFonts.goldmanHeaderDark.copyWith(
          fontSize: 80,
          color: Colors.white,
          fontWeight: FontWeight.w200,
          letterSpacing: 0,
        ),
        displayMedium: TextStyleFonts.isProperties
            .copyWith(fontSize: 16, color: Colors.white),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.black,
        background: Colors.black,
        shadow: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
