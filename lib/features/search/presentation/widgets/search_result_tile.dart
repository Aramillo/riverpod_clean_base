import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';
import 'package:riverpod_clean_base/core/router/route_names.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/app_image.dart';

class SearchResultTile extends StatelessWidget {
  final Movie movie;

  const SearchResultTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () => context.pushNamed(
        RouteNames.movieDetail,
        pathParameters: {'id': movie.id.toString()},
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AppImage(
          imageUrl: movie.posterPath != null
              ? '${ApiConstants.posterW185}${movie.posterPath}'
              : null,
          width: 48,
          height: 72,
        ),
      ),
      title: Text(
        movie.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 14),
          const SizedBox(width: 4),
          Text(
            movie.voteAverage.toStringAsFixed(1),
            style: theme.textTheme.bodySmall,
          ),
          if (movie.releaseDate != null && movie.releaseDate!.length >= 4) ...[
            const SizedBox(width: 12),
            Text(
              movie.releaseDate!.substring(0, 4),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
