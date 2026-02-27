import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/core/theme/app_color_scheme.dart';
import 'package:riverpod_clean_base/features/settings/presentation/providers/theme_provider.dart';

class ColorSchemeGrid extends ConsumerWidget {
  const ColorSchemeGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScheme = ref.watch(colorSchemeNotifierProvider);
    final theme = Theme.of(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: AppColorScheme.values.length,
      itemBuilder: (context, index) {
        final scheme = AppColorScheme.values[index];
        final isSelected = scheme == currentScheme;

        return GestureDetector(
          onTap: () => ref
              .read(colorSchemeNotifierProvider.notifier)
              .setColorScheme(scheme),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: scheme.seed,
              borderRadius: BorderRadius.circular(16),
              border: isSelected
                  ? Border.all(
                      color: theme.colorScheme.primary,
                      width: 3,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: scheme.seed.withValues(alpha: 0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSelected)
                  const Icon(Icons.check, color: Colors.white, size: 28),
                const SizedBox(height: 4),
                Text(
                  scheme.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
