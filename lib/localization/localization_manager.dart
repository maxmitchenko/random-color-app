import 'dart:io';

import 'package:random_color_app/utils/strings.dart';

class LocalizationManager {
  static String getTitle() {
    final local = Platform.localeName;
    if (local.contains('en')) {
      return 'Random Color App';
    } else {
      if (local.contains('uk')) {
        return 'Генератор кольорів';
      }
    }

    return defaultMainTitle;
  }

  static String getButtonText() {
    final local = Platform.localeName;
    if (local.contains('en')) {
      return 'Get random color!';
    } else {
      if (local.contains('uk')) {
        return 'Сгенерувати!';
      }
    }

    return defaultButtonText;
  }
}
