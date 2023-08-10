import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDarkModeEnabled => Theme.of(this).brightness == Brightness.dark;
}
