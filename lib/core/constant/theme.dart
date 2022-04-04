import 'package:flutter/material.dart';

class AppTheme {
  //======Light Theme=======//
  static ThemeData light = ThemeData(
    //Color Scheme
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.green.shade600,
      primary: Colors.green.shade800,
    ),
  );
}
