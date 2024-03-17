abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchCharactersLoadingState extends SearchState {}

class SearchCharactersSuccessState extends SearchState {}

class SearchCharactersErrorState extends SearchState {
  final String failure;
  SearchCharactersErrorState(this.failure);
}

class SearchLoadMoreCharactersLoadingState extends SearchState {}

class SearchLoadMoreCharactersSuccessState extends SearchState {}

class SearchLoadMoreCharactersErrorState extends SearchState {
  final String failure;
  SearchLoadMoreCharactersErrorState(this.failure);
}
