import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/data/models/news_model/news_model.dart';
import 'package:news_app/Features/Home/data/repos/home_repo.dart';
part 'top_head_lines_state.dart';

class TopHeadLinesCubit extends Cubit<TopHeadLinesState> {
  TopHeadLinesCubit(this.homeRepo) : super(TopHeadLinesInitial());

  final HomeRepo homeRepo;

  Future<void> getTopHeadLines({
    required String apiKey,
    required String country,
    required String category,
  }) async {
    emit(TopHeadLinesLoading());

    var result = await homeRepo.getToHeadLines(
        apiKey: apiKey, country: country, category: category);

    result.fold((failure) {
      emit(TopHeadLinesError(errorMessage: failure.errorMessage));
    }, (news) {
      emit(TopHeadLinesSuccess(news: news));
    });
  }
}
