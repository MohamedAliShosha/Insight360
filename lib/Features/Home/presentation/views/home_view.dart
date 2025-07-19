import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/home_view_body.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                onTap: () => GoRouter.of(context).push(AppRouter.kProfileView),
                child: const Icon(Icons.person, color: Colors.white),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => TopHeadLinesCubit(
            getIt<HomeRepoImplement>(),
          )..getTopHeadLines(
              apiKey: Constants.apiKey,
              country: 'us',
              category: 'general',
            ),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
