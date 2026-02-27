import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/favorites/presentation/widgets/favorite_button.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/widgets/cast_list.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/widgets/movie_backdrop_header.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/widgets/similar_movies_section.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/error_view.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/loading_view.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/section_header.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(movieDetailProvider(movieId));
    final theme = Theme.of(context);

    return Scaffold(
      body: detailAsync.when(
        loading: () => const LoadingView(),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(movieDetailProvider(movieId)),
        ),
        data: (detail) => CustomScrollView(
          slivers: [
            MovieBackdropHeader(detail: detail),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Genres + Favorite
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: detail.genres
                                .map((g) => Chip(
                                      label: Text(g),
                                      visualDensity: VisualDensity.compact,
                                    ))
                                .toList(),
                          ),
                        ),
                        FavoriteButton(movieId: movieId),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Overview
                    if (detail.overview != null &&
                        detail.overview!.isNotEmpty) ...[
                      Text(
                        'Overview',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detail.overview!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionHeader(title: 'Cast'),
            ),
            SliverToBoxAdapter(child: CastList(movieId: movieId)),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: SectionHeader(title: 'Similar Movies'),
            ),
            SliverToBoxAdapter(
              child: SimilarMoviesSection(movieId: movieId),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
