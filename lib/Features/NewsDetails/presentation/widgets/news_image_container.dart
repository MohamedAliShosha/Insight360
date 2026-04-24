import 'package:flutter/material.dart';
import '../../../Home/data/models/news_model/article.dart';
import '../../../../core/utils/colors_manager.dart';

class NewsImageContainer extends StatelessWidget {
  const NewsImageContainer({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 420,
          width: 431,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image:
                  article.urlToImage != null && article.urlToImage!.isNotEmpty
                      ? NetworkImage(article.urlToImage!)
                      : const AssetImage('Assets/Images/general.png')
                          as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
