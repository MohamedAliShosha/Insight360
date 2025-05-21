import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/Features/Home/presentation/manager/TopHeadLinesCubit/top_head_lines_cubit.dart';
import 'package:news_app/Features/Home/presentation/widgets/home_view_body.dart';
import 'package:news_app/core/utils/api_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TopHeadLinesCubit>(
        create: (context) => TopHeadLinesCubit(
          HomeRepoImplement(
            ApiService(
              Dio(),
            ),
          ),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
