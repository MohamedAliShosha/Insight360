import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item_shimmer.dart';
import 'package:news_app/Features/Search/presentation/manager/SearchCubit/search_cubit.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const NewsItemShimmer();
        } else if (state is SearchSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        //Add fixed width & height
                        width: 80,
                        height: 120,
                        child: NewsItem(
                          article: state.articles[index],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         state.books[index].volumeInfo.title ??
                      //             'Unknown Title',
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 2,
                      //         style: Styles.txtStyle20.copyWith(
                      //           fontFamily: kGtSectraFine,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 3),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing To Show',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
