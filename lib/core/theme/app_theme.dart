import 'package:flutter/material.dart';
import 'package:riverpod_clean_base/core/theme/app_color_scheme.dart';
import 'package:riverpod_clean_base/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData light(AppColorScheme scheme) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: scheme.seed,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }

  static ThemeData dark(AppColorScheme scheme) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: scheme.seed,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}
