import 'package:flutter/material.dart';

extension GapExtension on num {
  Widget get xGap => SizedBox(width: toDouble());

  Widget get yGap => SizedBox(height: toDouble());
}
