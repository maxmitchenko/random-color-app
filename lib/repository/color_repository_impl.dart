import 'dart:math' as math;
import 'dart:ui';

import 'package:random_color_app/repository/base_color_repository.dart';

/// Implementation of [BaseColorRepository]
class ColorRepositoryImpl extends BaseColorRepository {
  static const int _multiplier = 0xFFFFFF;

  /// With this method you can get a random color
  @override
  Color getColor() => _getRandomColor();

  Color _getRandomColor() =>
      Color((math.Random().nextDouble() * _multiplier).toInt())
          .withOpacity(1.0);
}
