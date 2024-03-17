import '../data/models/quote.dart';

abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersSuccessState extends CharactersState {}

class LoadMoreCharactersSuccessState extends CharactersState {}

class CharactersErrorState extends CharactersState {
  final String failure;
  CharactersErrorState(this.failure);
}

class QuotesLoadingState extends CharactersState {}

class QuotesSearchState extends CharactersState {}

class QuotesSuccessState extends CharactersState {
  final List<Quote> quote;
  QuotesSuccessState(this.quote);
}

class QuotesErrorState extends CharactersState {
  final String failure;
  QuotesErrorState(this.failure);
}
