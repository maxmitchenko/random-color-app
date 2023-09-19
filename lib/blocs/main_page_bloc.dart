import 'dart:async';

import 'package:flutter/material.dart';
import 'package:random_color_app/repository/base_color_repository.dart';
import 'package:random_color_app/interfaces/closeable.dart';

class MainPageBloc implements Closeable {
  final BaseColorRepository _colorRepository;
  MainPageBloc(this._colorRepository) {
    changeColor();
  }
  final StreamController<Color> _colorController = StreamController<Color>();
  Stream<Color> get colorStream => _colorController.stream;

  void changeColor() => _colorController.add(
        _colorRepository.getColor(),
      );

  @override
  void close() {
    _colorController.close();
  }
}
