import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Home/data/models/news_model/article.dart';
import '../../../../core/utils/colors_manager.dart';

class NewsDate extends StatelessWidget {
  const NewsDate({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(article.publishedAt ?? '')),
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.25,
            color: ColorsManager.kLightGrey),
      ),
    );
  }
}
