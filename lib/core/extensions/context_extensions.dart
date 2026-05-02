import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // MediaQuery
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double getTextScaleFactor() {
    final width = MediaQuery.of(this).size.width;
    if (width >= 1600) return 0.85;
    if (width >= 1400) return 0.85;
    return 0.85;
  }

  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1100;
  bool get isTablet => MediaQuery.sizeOf(this).width >= 700;
  bool get isMobile => !isDesktop && !isTablet;

  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  // FoucsNode
  FocusNode get foucs => FocusScope.of(this);

  // SnackBar
  void showSnackBar({required String message, bool isError = true}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: .floating,
      ),
    );
  }
}
