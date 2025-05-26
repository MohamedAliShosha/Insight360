import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/NewsDetails/presentation/widgets/custom_news_section.dart';
import 'package:news_app/core/utils/colors_manager.dart';

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
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 420,
                  width: 431,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: article.urlToImage != null &&
                              article.urlToImage!.isNotEmpty
                          ? NetworkImage(article.urlToImage!)
                          : const AssetImage('Assets/Images/general.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              maxLines: 15, //
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              article.description ??
                  article.content ??
                  'No description available',

              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.93,
                  color: ColorsManager.kPrimaryBlue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(article.publishedAt ?? '')),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.25,
                  color: ColorsManager.kLightGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              article.source?.name ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorsManager.kBlack),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          NewsAction(articleModel: article),
        ],
      ),
    );
  }
}
