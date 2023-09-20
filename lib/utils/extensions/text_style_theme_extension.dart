import 'package:flutter/material.dart';

/// [TextStyleThemeExtension] is used to get a custom [TextStyle]
extension TextStyleThemeExtension on TextTheme {
  /// This getter returns a general [TextStyle] with fontSize 20;
  TextStyle get baseTextStyle => const TextStyle(
        fontSize: 20,
      );
}
