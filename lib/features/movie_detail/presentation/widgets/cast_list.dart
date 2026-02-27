import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:riverpod_clean_base/shared/presentation/widgets/app_image.dart';

class CastList extends ConsumerWidget {
  final int movieId;

  const CastList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditsAsync = ref.watch(movieCreditsProvider(movieId));
    final theme = Theme.of(context);

    return creditsAsync.when(
      loading: () => const SizedBox(
        height: 140,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (cast) => SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: cast.length > 20 ? 20 : cast.length,
          itemBuilder: (context, index) {
            final member = cast[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      child: ClipOval(
                        child: AppImage(
                          imageUrl: member.profilePath != null
                              ? '${ApiConstants.profileW185}${member.profilePath}'
                              : null,
                          width: 72,
                          height: 72,
                          placeholderIcon: Icons.person,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      member.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (member.character != null)
                      Text(
                        member.character!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
