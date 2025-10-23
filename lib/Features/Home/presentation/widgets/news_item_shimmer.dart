import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class NewsItemShimmer extends StatelessWidget {
  const NewsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: ColorsManager.kLightGrey.withOpacity(0.3),
        highlightColor: ColorsManager.kWhiteColor.withOpacity(0.6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                color: ColorsManager.kWhiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      height: 14,
                      width: double.infinity,
                      color: ColorsManager.kLightGrey,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
