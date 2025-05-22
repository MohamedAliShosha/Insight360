part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Article> articles;

  const SearchSuccess({required this.articles});

  @override
  List<Object> get props => [articles];
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure({required this.errorMessage});
}
