import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class SearchShimmerItem extends StatelessWidget {
  const SearchShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: ColorsManager.kLightGrey.withOpacity(0.3),
        highlightColor: ColorsManager.kWhite.withOpacity(0.6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                color: ColorsManager.kWhite,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    color: ColorsManager.kLightGrey,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 14,
                    width: 100,
                    color: ColorsManager.kLightGrey,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 16,
                    width: 60,
                    color: ColorsManager.kLightGrey,
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
