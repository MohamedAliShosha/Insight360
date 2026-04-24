import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/colors_manager.dart';

/// Generic shimmer widget that can be customized for different use cases
class GenericShimmer extends StatelessWidget {
  const GenericShimmer({
    super.key,
    required this.children,
    this.padding = EdgeInsets.zero,
    this.baseColorOpacity = 0.3,
    this.highlightColorOpacity = 0.6,
  });

  final List<Widget> children;
  final EdgeInsets padding;
  final double baseColorOpacity;
  final double highlightColorOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: ColorsManager.kLightGrey.withOpacity(baseColorOpacity),
        highlightColor:
            ColorsManager.kWhiteColor.withOpacity(highlightColorOpacity),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
