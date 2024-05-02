import 'package:flutter/material.dart';

enum AppRadius {
  /// circular 4
  xs,

  /// circular 8
  s,

  /// circular 12
  m,

  /// circular 16
  l,

  /// circular 20
  xl,

  /// circular 24
  xxl,

  /// circular 28
  xxxl
}

extension AppRadiusExtension on AppRadius {
  BorderRadius get value {
    switch (this) {
      case AppRadius.xs:
        return BorderRadius.circular(4);
      case AppRadius.s:
        return BorderRadius.circular(8);
      case AppRadius.m:
        return BorderRadius.circular(12);
      case AppRadius.l:
        return BorderRadius.circular(16);
      case AppRadius.xl:
        return BorderRadius.circular(20);
      case AppRadius.xxl:
        return BorderRadius.circular(24);
      case AppRadius.xxxl:
        return BorderRadius.circular(28);
    }
  }
}
