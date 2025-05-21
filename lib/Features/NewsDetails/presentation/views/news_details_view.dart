import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/NewsDetails/presentation/widgets/news_details_view_body.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsDetailsViewBody(
        article: article,
      ),
    );
  }
}
