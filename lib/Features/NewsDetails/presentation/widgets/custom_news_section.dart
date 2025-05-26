import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/NewsDetails/presentation/widgets/custom_button.dart';
import 'package:news_app/core/functions/launch_url_function.dart';

class NewsAction extends StatelessWidget {
  const NewsAction({super.key, required this.articleModel});
  final Article articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: '19.99\$',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, articleModel.url);
              },
              fontSize: 16,
              text: getText(articleModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(Article articleModel) {
    if (articleModel.url == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
