import 'package:flutter/material.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/app_image.dart';

class MovieBackdropHeader extends StatelessWidget {
  final MovieDetail detail;

  const MovieBackdropHeader({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(
              imageUrl: detail.backdropPath != null
                  ? '${ApiConstants.backdropOriginal}${detail.backdropPath}'
                  : null,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    theme.colorScheme.surface,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppImage(
                    imageUrl: detail.posterPath != null
                        ? '${ApiConstants.posterW185}${detail.posterPath}'
                        : null,
                    width: 100,
                    height: 150,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          detail.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (detail.tagline != null &&
                            detail.tagline!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            detail.tagline!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '${detail.voteAverage.toStringAsFixed(1)} (${detail.voteCount})',
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 16),
                            if (detail.runtime > 0) ...[
                              Icon(Icons.schedule, size: 16, color: theme.colorScheme.outline),
                              const SizedBox(width: 4),
                              Text(
                                '${detail.runtime} min',
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
