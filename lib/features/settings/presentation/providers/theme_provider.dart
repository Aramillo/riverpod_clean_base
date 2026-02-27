import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/providers/core_providers.dart';
import 'package:riverpod_clean_base/core/theme/app_color_scheme.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final index = prefs.getInt(_key) ?? 0;
    return ThemeMode.values[index];
  }

  void setThemeMode(ThemeMode mode) {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt(_key, mode.index);
    state = mode;
  }
}

@riverpod
class ColorSchemeNotifier extends _$ColorSchemeNotifier {
  static const _key = 'color_scheme';

  @override
  AppColorScheme build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final index = prefs.getInt(_key) ?? 0;
    return AppColorScheme.values[index];
  }

  void setColorScheme(AppColorScheme scheme) {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt(_key, scheme.index);
    state = scheme;
  }
}
