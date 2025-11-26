import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/data/repos/home_repo.dart';
import 'package:news_app/core/utils/constants.dart';
part 'top_head_lines_state.dart';

class TopHeadLinesCubit extends Cubit<TopHeadLinesState> {
  TopHeadLinesCubit(this.homeRepo) : super(TopHeadLinesInitial());

  final HomeRepo homeRepo;

  Future<void> getTopHeadLines({
    required String apiKey,
    required String country,
    required String category,
    int pageNumber = 1, // 3 => Setting a default value for the first page
  }) async {
    if (pageNumber == 1) {
      emit(TopHeadLinesLoading());
    } else {
      emit(TopHeadLinesPaginationLoading());
    }

    var result = await homeRepo.getToHeadLines(
        pageNumber:
            pageNumber, // 4 => passing the pageNumber to the pageNumber argument of the homeRepo method.
        apiKey: apiKey,
        country: country,
        category: category);

    result.fold((failure) {
      if (pageNumber == 1) {
        emit(TopHeadLinesFailure(errorMessage: failure.errorMessage));
      } else {
        emit(TopHeadLinesPaginationFailure(errorMessage: failure.errorMessage));
      }
    }, (article) {
      emit(TopHeadLinesSuccess(articles: article));
    });
  }

  // This function has the same logic of the "getQuotes" one but without check fetching quotes because it role is to get quotes as it is a refresher
  Future<void> refreshHeadLines() async {
    // This method is used when user pulls to refresh
    emit(TopHeadLinesLoading());
    final result = await homeRepo.getToHeadLines(
        apiKey: Constants.apiKey, country: 'us', category: 'general');
    result.fold(
        (failure) =>
            emit(TopHeadLinesFailure(errorMessage: failure.errorMessage)),
        (articles) {
      emit(
        TopHeadLinesSuccess(articles: articles),
      );
      log('HeadLines Refreshed');
    });
  }
}
