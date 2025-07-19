import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> getSearchedNews(
      {required String apiKey,
      required String category,
      required String country}) async {
    emit(SearchLoading());

    var result = await searchRepo.getSearchedNews(
        apiKey: apiKey, country: country, category: category);

    result.fold((failure) {
      emit(
        SearchFailure(errorMessage: failure.errorMessage),
      );
    }, (article) {
      emit(
        SearchSuccess(articles: article),
      );
    });
  }
}
