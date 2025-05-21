import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';
import 'package:news_app/core/widgets/custom_loading_indicator.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadLinesCubit, TopHeadLinesState>(
      builder: (context, state) {
        if (state is TopHeadLinesSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kNewsDetailsView);
                    },
                    child: NewsItem(
                      article: state.articles[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is TopHeadLinesError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
