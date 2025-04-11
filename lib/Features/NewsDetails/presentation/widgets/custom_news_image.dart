import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNewsImage extends StatelessWidget {
  const CustomNewsImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // clipRRect is used to clip the image to a rounded rectangle shape
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      // cached network image is used to cache the image and load it faster
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => const Icon(Icons.warning),
        fit: BoxFit.fill,
        imageUrl: imageUrl,
      ),
    );
  }
}
