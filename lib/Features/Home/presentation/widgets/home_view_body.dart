import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item_shimmer.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_list_view.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadLinesCubit, TopHeadLinesState>(
      builder: (context, state) {
        if (state is TopHeadLinesSuccess) {
          return NewsListView(articles: state.articles);
        } else if (state is TopHeadLinesError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return ListView.builder(
            itemCount: 19,
            itemBuilder: (context, index) {
              return const NewsItemShimmer();
            },
          );
        }
      },
    );
  }
}
