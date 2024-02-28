import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaColorLigth => Colors.blue.shade400;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get buttonColor => Theme.of(this).highlightColor;
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
}
