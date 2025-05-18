part of 'top_head_lines_cubit.dart';

sealed class TopHeadLinesState extends Equatable {
  const TopHeadLinesState();

  @override
  List<Object> get props => [];
}

final class TopHeadLinesInitial extends TopHeadLinesState {}

final class TopHeadLinesLoading extends TopHeadLinesState {}

final class TopHeadLinesSuccess extends TopHeadLinesState {
  final List<NewsModel> news;
  const TopHeadLinesSuccess({required this.news});
}

final class TopHeadLinesError extends TopHeadLinesState {
  final String errorMessage;
  const TopHeadLinesError({required this.errorMessage});
}
