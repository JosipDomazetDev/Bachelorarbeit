import 'dart:io';

bool isTestMode() {
  return Platform.environment.containsKey('FLUTTER_TEST');
}
