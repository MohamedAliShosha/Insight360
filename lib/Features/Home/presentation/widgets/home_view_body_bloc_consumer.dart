import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/news_model/article.dart';
import '../manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'news_item_shimmer.dart';
import 'news_list_view.dart';
import '../../../../core/functions/snack_bar_function.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/widgets/custom_error_widget.dart';

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
          showCustomSnackBar(
            context: context,
            message: 'There is no more books',
            backgroundColor: ColorsManager.kPrimaryColor,
            duration: const Duration(seconds: 3),
            textColor: ColorsManager.kPrimaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            isCentered: true,
          );
        }
      },
      builder: (context, state) {
        if (state is TopHeadLinesSuccess ||
            state is TopHeadLinesPaginationLoading ||
            state is TopHeadLinesPaginationFailure) {
          return NewsListView(
            // load the new books added to the existing ones
            articles: articles,
          );
        } else if (state is TopHeadLinesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (_, __) => const NewsItemShimmer(),
        );
      },
    );
  }
}
