import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';
import 'package:riverpod_clean_base/core/router/route_names.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/app_image.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String? posterPath;
  final String title;
  final double? voteAverage;
  final double width;
  final double height;

  const MovieCard({
    super.key,
    required this.id,
    this.posterPath,
    required this.title,
    this.voteAverage,
    this.width = 140,
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteNames.movieDetail,
        pathParameters: {'id': id.toString()},
      ),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppImage(
                  imageUrl: posterPath != null
                      ? '${ApiConstants.posterW342}$posterPath'
                      : null,
                  width: width,
                  height: height,
                  borderRadius: BorderRadius.circular(12),
                ),
                if (voteAverage != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            voteAverage!.toStringAsFixed(1),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
