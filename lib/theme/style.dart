import 'package:flutter/material.dart';

class Style {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff6096BA),
    backgroundColor: Colors.white,
    cursorColor: Color(0xff124559).withOpacity(0.3),
    accentColor: Color(0xff124559),
    cardColor: Color(0xffF18F01),
    errorColor: Color(0xffED2939),
    fontFamily: 'Roboto Condensed',
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 102,
        fontWeight: FontWeight.w700,
        color: Color(0xff6096BA),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
      headline2: TextStyle(
        fontSize: 102,
        fontWeight: FontWeight.w700,
        color: Color(0xff124559),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
      headline3: TextStyle(
          fontSize: 28.42, fontWeight: FontWeight.w500, color: Colors.black),
      headline4: TextStyle(
          fontSize: 21.32, fontWeight: FontWeight.w500, color: Colors.black),
      headline5: TextStyle(
          fontSize: 16.00, fontWeight: FontWeight.w500, color: Colors.black),
      headline6: TextStyle(
          fontSize: 12.00, fontWeight: FontWeight.w700, color: Colors.black),
      subtitle1: TextStyle(
          fontSize: 12.00, fontWeight: FontWeight.w500, color: Colors.black),
      subtitle2: TextStyle(
          fontSize: 9.00, fontWeight: FontWeight.w700, color: Colors.black),
      bodyText1: TextStyle(
          fontSize: 12.00, fontWeight: FontWeight.w300, color: Colors.black),
      bodyText2: TextStyle(
          fontSize: 9.00, fontWeight: FontWeight.w500, color: Colors.black),
      button: TextStyle(
          fontSize: 21.32, fontWeight: FontWeight.w700, color: Colors.black),
      overline: TextStyle(
          fontSize: 16.00,
          fontWeight: FontWeight.w700,
          color: Color(0xff25D06B)),
    ),
  );
}
