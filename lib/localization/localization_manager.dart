import 'dart:io';

import 'package:random_color_app/utils/strings.dart';

/// [LocalizationManager] contains the methods to get a text depending on
/// a platform's localization.
class LocalizationManager {
  // ignore: public_member_api_docs
  static String getTitleText() {
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

  // ignore: public_member_api_docs
  static String getHelloText() {
    final local = Platform.localeName;
    if (local.contains('en')) {
      return 'Hello there';
    } else {
      if (local.contains('uk')) {
        return 'Привіт';
      }
    }

    return defaultButtonText;
  }
}
