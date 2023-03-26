import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

// -- Light & Dark Outlined Button Themes --
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

// -- Light Theme --
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      foregroundColor: tSecondaryColor,
      // backgroundColor: tWhiteColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      foregroundColor: tWhiteColor,
      // backgroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
