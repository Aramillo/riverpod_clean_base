import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/home/presentation/providers/home_providers.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/movie_card.dart';
import 'package:shimmer/shimmer.dart';

class PopularMoviesSection extends ConsumerStatefulWidget {
  const PopularMoviesSection({super.key});

  @override
  ConsumerState<PopularMoviesSection> createState() =>
      _PopularMoviesSectionState();
}

class _PopularMoviesSectionState extends ConsumerState<PopularMoviesSection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(popularMoviesNotifierProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularAsync = ref.watch(popularMoviesNotifierProvider);

    return popularAsync.when(
      loading: () => _buildShimmerGrid(context),
      error: (_, __) => const Center(child: Text('Failed to load popular movies')),
      data: (movies) => GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(
            id: movie.id,
            posterPath: movie.posterPath,
            title: movie.title,
            voteAverage: movie.voteAverage,
            width: double.infinity,
            height: 160,
          );
        },
      ),
    );
  }

  Widget _buildShimmerGrid(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
