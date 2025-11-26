import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';
import 'package:news_app/core/utils/constants.dart';

class NewsListView extends StatefulWidget {
  final List<Article> articles;

  const NewsListView({super.key, required this.articles});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  // Scroll controller used to monitor the scrolling position in the ListView
  late final ScrollController _scrollController;
  var nextPage = 2; // The next page number to request
  // A flag to prevent triggering multiple loading operations at once
  var isLoading = false;

  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    // The current scroll position in pixels
    var currentPosition = _scrollController.position.pixels;
    // The maximum scroll extent (the furthest point the list can scroll to)
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    // If the user has reached 70% of the scrollable area
    if (currentPosition >= 0.7 * maxScrollExtent) {
      // Only load more data if no loading operation is currently happening
      if (!isLoading) {
        isLoading =
            true; /* 
            - Now loading starts
            - Prevents the block from triggering again
*/
        // Call the Cubit to fetch the next page of books from the API

        await BlocProvider.of<TopHeadLinesCubit>(context).getTopHeadLines(
          apiKey: Constants.apiKey,
          country: 'us',
          category: 'general',
          pageNumber: nextPage++, // Pass the page number, then increment it
        );
        isLoading =
            false; /*
            - → Ready to load next page when user scrolls again
            - → Next scroll: if(!false) → true
            - And the cycle repeats.
             */
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.articles.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 125,
          child: NewsItem(
            article: widget.articles[index],
          ),
        );
      },
    );
  }
}
