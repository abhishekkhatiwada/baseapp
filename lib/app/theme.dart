import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:baseapp/common/constants/fonts.dart';

class CustomTheme {
  // Main colors
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xffDC143C);
  static const Color secondaryColor = Color(0xff0000ff);
  static const Color primaryTextColor = Color(0xff000000);
  static const Color secondaryTextColor = Color(0xffffffff);
  static const double symmetricHozPadding = 10;
  static const double symmetricVerPadding = 10;

  // Gray colors
  static const Color gray = Color(0xFFC4C4C4);
  static const Color lightGray = Color(0xFFF2f2F2);
  static const Color midGrayColor = Color(0xFFC6C6C6);
  static const Color darkGrayColor = Color(0xFF757575);

  // Other colors
  static const Color yellow = Color(0xFFF0C21F);
  static const Color black = Color(0xff000000);
  static const Color green = Color(0xff008D47);
  static const Color white = Color(0xffffffff);

  // Text styles
  static const TextStyle displayLarge = TextStyle(
    color: primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    color: primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle displaySmall = TextStyle(
    color: primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: primaryTextColor,
    fontSize: 18,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle headlineSmall = TextStyle(
    color: primaryTextColor,
    fontSize: 16,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle titleLarge = TextStyle(
    color: primaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle titleMedium = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    height: 1.35,
    letterSpacing: 0.5,
  );
  static const TextStyle titleSmall = TextStyle(
    color: primaryTextColor,
    fontSize: 10,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle labelLarge = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    height: 1.35,
    letterSpacing: 0.5,
  );
  static const TextStyle labelMedium = TextStyle(
    color: primaryTextColor,
    fontSize: 10,
    height: 1.35,
    letterSpacing: 0.5,
  );
  static const TextStyle labelsmall = TextStyle(
    color: primaryTextColor,
    fontSize: 8,
    height: 1.35,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 12,
    color: primaryTextColor,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 10,
    color: primaryTextColor,
    height: 1.35,
    letterSpacing: 0.5,
  );
  static const TextStyle bodySmall = TextStyle(
    color: primaryTextColor,
    fontSize: 8,
    height: 1.35,
    letterSpacing: 0.5,
  );

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    shadowColor: Colors.black,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: primaryColor),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: backgroundColor,
    iconTheme: const IconThemeData(color: black),
    fontFamily: Fonts.inter,
    textTheme: const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      bodySmall: bodySmall,
      titleSmall: titleSmall,
      titleMedium: titleMedium,
      labelLarge: labelLarge,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      labelMedium: labelMedium,
      labelSmall: labelsmall,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  // Helper method to access text styles easily
  static TextStyle getStyle(TextStyle style,
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return style.copyWith(
      color: color ?? style.color,
      fontSize: fontSize ?? style.fontSize,
      fontWeight: fontWeight ?? style.fontWeight,
    );
  }
}
