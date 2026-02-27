import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/movie_card.dart';

class SimilarMoviesSection extends ConsumerWidget {
  final int movieId;

  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarAsync = ref.watch(similarMoviesProvider(movieId));

    return similarAsync.when(
      loading: () => const SizedBox(
        height: 260,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (movies) {
        if (movies.isEmpty) return const SizedBox.shrink();
        return SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length > 10 ? 10 : movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MovieCard(
                  id: movie.id,
                  posterPath: movie.posterPath,
                  title: movie.title,
                  voteAverage: movie.voteAverage,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
