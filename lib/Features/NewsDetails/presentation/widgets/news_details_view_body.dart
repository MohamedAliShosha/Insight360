import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Home/data/models/news_model/article.dart';
import 'custom_news_section.dart';
import 'news_image_container.dart';
import 'news_description.dart';
import 'news_date.dart';
import 'news_source.dart';
import '../../../../core/utils/colors_manager.dart';

class NewsDetailsViewBody extends StatelessWidget {
  const NewsDetailsViewBody({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: NewsImageContainer(article: article),
          ),
          NewsDescription(article: article),
          NewsDate(article: article),
          NewsSource(article: article),
          const SizedBox(
            height: 30,
          ),
          NewsAction(articleModel: article),
        ],
      ),
    );
  }
}
