import 'dart:ui';
import 'dart:math' as math;

import 'package:random_color_app/repository/base_color_repository.dart';

class ColorRepositoryImpl extends BaseColorRepository {
  @override
  Color getColor() => _getRandomColor();

  Color _getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
