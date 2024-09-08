import 'package:flutter/foundation.dart';

class CustomLog {
  static void log(dynamic value, {String color = '37'}) {
    _printWithColor(value, color);
  }

  static void errorLog(dynamic value) {
    _printWithColor(value, '31');
  }

  static void warningLog(dynamic value) {
    _printWithColor(value, '33');
  }

  static void successLog(dynamic value) {
    _printWithColor(value, '32');
  }

  static void actionLog(dynamic value) {
    _printWithColor(value, '36');
  }

  static void _printWithColor(dynamic value, String colorCode) {
    if (kDebugMode) {
      debugPrint("\x1B[${colorCode}m $value \x1B[0m");
    }
  }
}
