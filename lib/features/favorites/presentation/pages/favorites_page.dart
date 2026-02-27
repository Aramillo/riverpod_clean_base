import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_base/core/router/route_names.dart';
import 'package:riverpod_clean_base/features/favorites/presentation/providers/favorites_providers.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/app_image.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoriteIds.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the heart icon on any movie to save it here',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteIds.length,
              itemBuilder: (context, index) {
                final movieId = favoriteIds[index];
                return _FavoriteMovieTile(movieId: movieId);
              },
            ),
    );
  }
}

class _FavoriteMovieTile extends ConsumerWidget {
  final int movieId;

  const _FavoriteMovieTile({required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(movieDetailProvider(movieId));
    final theme = Theme.of(context);

    return detailAsync.when(
      loading: () => const ListTile(
        leading: SizedBox(width: 48, height: 72),
        title: Text('Loading...'),
      ),
      error: (_, __) => ListTile(
        title: Text('Movie #$movieId'),
        subtitle: const Text('Could not load details'),
        onTap: () => context.pushNamed(
          RouteNames.movieDetail,
          pathParameters: {'id': movieId.toString()},
        ),
      ),
      data: (detail) => ListTile(
        onTap: () => context.pushNamed(
          RouteNames.movieDetail,
          pathParameters: {'id': movieId.toString()},
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AppImage(
            imageUrl: detail.posterPath != null
                ? '${ApiConstants.posterW185}${detail.posterPath}'
                : null,
            width: 48,
            height: 72,
          ),
        ),
        title: Text(detail.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const SizedBox(width: 4),
            Text(detail.voteAverage.toStringAsFixed(1),
                style: theme.textTheme.bodySmall),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () =>
              ref.read(favoritesNotifierProvider.notifier).toggle(movieId),
        ),
      ),
    );
  }
}
