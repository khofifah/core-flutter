import 'package:flutter/material.dart';

//COLORS
const mainColor = Color(0xFFDC1F2E);
const secColor = Color(0xFF580C12);
const bgColor = Color(0xFFFFFFFF);
const textColor = Color(0xFF000000);
const errorColor = Color(0xFFFB3838);
const successColor = Color(0xFF17E510);
const warningColor = Color(0xFFFBBC05);

//TEXT STYLE
const titleFont = TextStyle(
  fontFamily: 'Gotham',
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const basicFont = TextStyle(
  fontFamily: 'Gotham',
  color: textColor,
  fontSize: 12,
);
const buttonFont = TextStyle(
  fontFamily: 'Gotham',
  color: bgColor,
  fontSize: 14,
);

//THEME DATA
ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: mainColor,
  accentColor: secColor,
  backgroundColor: secColor,
  scaffoldBackgroundColor: bgColor,
  primaryColorBrightness: Brightness.dark,
  buttonColor: secColor,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  // cardColor: bgColor,
  // errorColor: errorColor,
  textTheme: TextTheme(
    bodyText1: basicFont,
    button: buttonFont,
  ),
  iconTheme: IconThemeData(
    color: warningColor,
    size: 100,
  ),
);
