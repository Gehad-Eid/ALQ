import 'package:alqgp/Src/Utils/Theme/elevatedButton_theme.dart';
import 'package:alqgp/Src/Utils/Theme/outlinedButton_theme.dart';
import 'package:alqgp/Src/Utils/Theme/textFormField_theme.dart';
import 'package:alqgp/Src/Utils/Theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      // backgroundColor: Colors.transparent,
      color: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
