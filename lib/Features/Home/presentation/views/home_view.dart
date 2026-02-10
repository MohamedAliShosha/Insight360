import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/home_view_body.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TopHeadLinesCubit(
          getIt<HomeRepoImplement>(),
        )..getTopHeadLines(
            apiKey: Constants.apiKey,
            country: 'us',
            category: 'general',
          ),
        child: const SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
