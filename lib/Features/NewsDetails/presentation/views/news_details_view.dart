import 'package:flutter/material.dart';
import 'package:news_app/Features/NewsDetails/presentation/widgets/news_details_view_body.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsDetailsViewBody(),
    );
  }
}
