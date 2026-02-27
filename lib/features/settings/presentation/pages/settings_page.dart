import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_clean_base/features/settings/presentation/widgets/color_scheme_grid.dart';
import 'package:riverpod_clean_base/features/settings/presentation/widgets/theme_mode_selector.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Appearance',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text('Theme Mode', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          const ThemeModeSelector(),
          const SizedBox(height: 24),
          Text('Color Scheme', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          const ColorSchemeGrid(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Account',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.tonalIcon(
            onPressed: () =>
                ref.read(authNotifierProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'MovieDB Showcase v1.0.0',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
