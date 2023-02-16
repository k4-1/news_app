import 'package:flutter/material.dart';
import 'package:technical_test/app/core/utils/theme/widget_themes/text_theme.dart';

class KAppTheme {
  KAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: KTextTheme.lightTextTheme,
  );
}
