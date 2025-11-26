part of 'top_head_lines_cubit.dart';

sealed class TopHeadLinesState extends Equatable {
  const TopHeadLinesState();

  @override
  List<Object> get props => [];
}

final class TopHeadLinesInitial extends TopHeadLinesState {}

final class TopHeadLinesLoading extends TopHeadLinesState {}

final class TopHeadLinesPaginationLoading extends TopHeadLinesState {}

final class TopHeadLinesSuccess extends TopHeadLinesState {
  final List<Article> articles;
  const TopHeadLinesSuccess({required this.articles});
}

final class TopHeadLinesFailure extends TopHeadLinesState {
  final String errorMessage;
  const TopHeadLinesFailure({required this.errorMessage});
}

final class TopHeadLinesPaginationFailure extends TopHeadLinesState {
  final String errorMessage;
  const TopHeadLinesPaginationFailure({required this.errorMessage});
}
