import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/NewsDetails/presentation/widgets/custom_button.dart';
import 'package:news_app/core/functions/launch_url_function.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class NewsAction extends StatelessWidget {
  const NewsAction({super.key, required this.articleModel});
  final Article articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              launchCustomUrl(context, articleModel.url);
            },
            fontSize: 16,
            text: getText(articleModel),
            backgroundColor: ColorsManager.kWhiteColor,
            textColor: ColorsManager.kPrimaryBlue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
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
