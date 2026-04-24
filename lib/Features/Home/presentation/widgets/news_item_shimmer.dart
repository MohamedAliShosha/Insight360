import 'package:flutter/material.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/widgets/generic_shimmer.dart';

class NewsItemShimmer extends StatelessWidget {
  const NewsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericShimmer(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    );
  }
}
