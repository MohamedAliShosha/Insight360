import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    article.urlToImage != null && article.urlToImage!.isNotEmpty
                        ? NetworkImage(article.urlToImage!)
                        : const AssetImage('Assets/Images/general.png')
                            as ImageProvider,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            // تستخدم هنا بشكل صحيح داخل Row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ColorsManager.kPrimaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  article.publishedAt ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorsManager.kLightGrey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  article.source?.name ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorsManager.kPrimaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
