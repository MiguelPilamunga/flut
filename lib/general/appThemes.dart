import 'package:flutter/material.dart';

class AppThemes {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, _lighttextTheme);
  static ThemeData darkThemeData =
      themeData(darkColorScheme, _darkFocusColor, _darkTextTheme);

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, TextTheme textTheme) {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        elevation: 0,
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static const TextTheme _lighttextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 68, 66, 66),
    ),
    headline2: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF5F5FFF),
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0XFF030047),
    ),
    bodyText1: TextStyle(
      fontSize: 20.0,
      color: Color(0XFFB7B7D2),
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFF5F5FFF),
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Color(0XFFB7B7D2),
    ),
  );
  static const TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 211, 211, 214),
    ),
    headline2: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF5F5FFF),
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0XFF030047),
    ),
    bodyText1: TextStyle(
      fontSize: 20.0,
      color: Color(0XFFB7B7D2),
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFF5F5FFF),
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Color(0XFFB7B7D2),
    ),
  );
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 56, 42, 119),
    primaryVariant: Color.fromARGB(117, 56, 42, 119),
    secondary: Color(0xFF03DAC5),
    secondaryVariant: Color(0xFF0AE1C5),
    tertiary: Color.fromARGB(255, 12, 7, 88),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.lightBlue,
    primaryVariant: Color.fromARGB(141, 161, 190, 204),
    secondary: Colors.yellow,
    tertiary: Colors.lightBlue[700],
    secondaryVariant: Colors.yellow.shade900,
    background: Color(0xff141A31),
    surface: Color(0xff1E2746),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
