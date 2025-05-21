import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  final List<Article> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return SizedBox(
          height: 125,
          child: NewsItem(article: article),
        );
      },
    );
  }
}
