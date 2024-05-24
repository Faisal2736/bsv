 import 'package:flutter/material.dart';

import 'constants/constants.dart';

class AppTheme
 {
   const AppTheme._();
static ThemeData get lightTheme => ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Constants.primaryColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
);
 }