import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData placeholderIcon;

  const AppImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderIcon = Icons.movie_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widget = imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            width: width,
            height: height,
            fit: fit,
            placeholder: (_, __) => Shimmer.fromColors(
              baseColor: theme.colorScheme.surfaceContainerHighest,
              highlightColor: theme.colorScheme.surface,
              child: Container(color: Colors.white),
            ),
            errorWidget: (_, __, ___) => _Placeholder(
              icon: placeholderIcon,
              width: width,
              height: height,
            ),
          )
        : _Placeholder(icon: placeholderIcon, width: width, height: height);

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: widget);
    }
    return widget;
  }
}

class _Placeholder extends StatelessWidget {
  final IconData icon;
  final double? width;
  final double? height;

  const _Placeholder({required this.icon, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Icon(icon, color: Theme.of(context).colorScheme.outline, size: 40),
    );
  }
}
