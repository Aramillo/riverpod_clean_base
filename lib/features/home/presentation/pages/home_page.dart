import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/features/home/presentation/providers/home_providers.dart';
import 'package:riverpod_clean_base/features/home/presentation/widgets/popular_movies_section.dart';
import 'package:riverpod_clean_base/features/home/presentation/widgets/trending_carousel.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/section_header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('MovieDB')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(trendingMoviesProvider);
          ref.invalidate(popularMoviesNotifierProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Trending This Week'),
              const TrendingCarousel(),
              const SizedBox(height: 24),
              const SectionHeader(title: 'Popular'),
              const PopularMoviesSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
