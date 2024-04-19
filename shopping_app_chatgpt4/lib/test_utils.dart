import 'dart:io';

import 'package:flutter/foundation.dart';

bool isTestMode() {
  if (kIsWeb) {
    return false;
  }

  return Platform.environment.containsKey('FLUTTER_TEST');
}
