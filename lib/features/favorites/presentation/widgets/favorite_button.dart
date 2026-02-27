import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/favorites/presentation/providers/favorites_providers.dart';

class FavoriteButton extends ConsumerWidget {
  final int movieId;

  const FavoriteButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesNotifierProvider);
    final isFav = favorites.contains(movieId);

    return IconButton(
      onPressed: () =>
          ref.read(favoritesNotifierProvider.notifier).toggle(movieId),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(isFav),
          color: isFav
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}
