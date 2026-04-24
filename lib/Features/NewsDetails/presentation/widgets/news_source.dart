import 'package:flutter/material.dart';
import '../../../Home/data/models/news_model/article.dart';

class NewsSource extends StatelessWidget {
  const NewsSource({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        article.source?.name ?? '',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
      ),
    );
  }
}
