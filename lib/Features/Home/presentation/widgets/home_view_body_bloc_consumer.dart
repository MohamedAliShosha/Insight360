import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item_shimmer.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_list_view.dart';
import 'package:news_app/core/functions/build_error_snack_bar.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';

class HomeViewBodyBlocConsumer extends StatefulWidget {
  const HomeViewBodyBlocConsumer({
    super.key,
  });

  @override
  State<HomeViewBodyBlocConsumer> createState() =>
      _HomeViewBodyBlocConsumerState();
}

class _HomeViewBodyBlocConsumerState extends State<HomeViewBodyBlocConsumer> {
  List<Article> articles = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopHeadLinesCubit, TopHeadLinesState>(
      listener: (context, state) {
        if (state is TopHeadLinesSuccess) {
          // add the coming books to the books list
          articles.addAll(state.articles);
        }

        if (state is TopHeadLinesPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }

        if (state is TopHeadLinesLoading) {
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const NewsItemShimmer();
            },
          );
        }
      },
      builder: (context, state) {
        if (state is TopHeadLinesSuccess ||
            state is TopHeadLinesPaginationLoading ||
            state is TopHeadLinesFailure) {
          return NewsListView(
            articles: articles,
          );
        } else if (state is TopHeadLinesFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }
        return NewsListView(
          articles: articles,
        );
      },
    );
  }
}
