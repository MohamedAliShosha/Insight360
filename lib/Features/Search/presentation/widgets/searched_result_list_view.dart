import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Features/Search/presentation/manager/SearchCubit/search_cubit.dart';
import 'package:news_app/Features/Search/presentation/widgets/search_shimmer_item.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/widgets/custom_error_widget.dart';

class SearchedResultListView extends StatelessWidget {
  const SearchedResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kNewsDetailsView,
                      extra: state.articles[index]);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: state.articles[index].urlToImage != null &&
                                    state.articles[index].urlToImage!.isNotEmpty
                                ? NetworkImage(
                                    state.articles[index].urlToImage!)
                                : const AssetImage('Assets/Images/general.png')
                                    as ImageProvider,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.articles[index].title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ColorsManager.kWhiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                  state.articles[index].publishedAt ?? '')),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorsManager.kLightGrey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.articles[index].source!.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: ColorsManager.kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else if (state is SearchLoading) {
          return ListView.builder(
            itemCount: 19,
            itemBuilder: (context, index) {
              return const SearchShimmerItem();
            },
          );
        } else {
          return const CustomErrorWidget(errorMessage: 'No Results Yet.');
        }
      },
    );
  }
}
