import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item_shimmer.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_list_view.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopHeadLinesCubit(
        getIt<HomeRepoImplement>(),
      )..getTopHeadLines(
          apiKey: Constants.apiKey,
          country: 'us',
          category: 'general',
        ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: ColorsManager.kPrimaryBlue,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRouter.kSearchView),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.kProfileView),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: BlocBuilder<TopHeadLinesCubit, TopHeadLinesState>(
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
          ),
        ),
      ),
    );
  }
}
