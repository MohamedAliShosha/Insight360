import 'package:flutter/material.dart';
import '../../../Home/data/models/news_model/article.dart';
import '../../../../core/utils/colors_manager.dart';

class NewsDescription extends StatelessWidget {
  const NewsDescription({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        maxLines: 15,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        article.description ?? article.content ?? 'No description available',
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.93,
            color: ColorsManager.kWhiteColor),
      ),
    );
  }
}
