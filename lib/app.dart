import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/core/router/app_router.dart';
import 'package:riverpod_clean_base/core/theme/app_theme.dart';
import 'package:riverpod_clean_base/features/settings/presentation/providers/theme_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);
    final colorScheme = ref.watch(colorSchemeNotifierProvider);

    return MaterialApp.router(
      title: 'MovieDB',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.light(colorScheme),
      darkTheme: AppTheme.dark(colorScheme),
      routerConfig: router,
    );
  }
}
