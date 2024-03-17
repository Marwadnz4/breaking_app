import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'characters_state.dart';
import '../data/repository/characters_repo.dart';
import '../../../core/models/character.dart';
import 'package:flutter/material.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  CharactersCubit(this.charactersRepo) : super(CharactersInitialState()) {
    scrollController.addListener(() {
      getMoreCharacters();
    });
  }

  List<Character> allCharacters = [];
  List<Character> searchedForAllCharacters = [];
  ScrollController scrollController = ScrollController();

  bool isLoadingMore = false;
  int page = 1;

  Future<void> getCharacters() async {
    emit(CharactersLoadingState());
    final charsRepo = await charactersRepo.getCharacters(page);
    charsRepo.fold(
      (failure) => emit(CharactersErrorState(failure.errMessage)),
      (charactersResponse) {
        isLoadingMore = charactersResponse.info.next == null ? false : true;
        allCharacters.addAll(charactersResponse.characters);
        emit(CharactersSuccessState());
      },
    );
  }

  Future<void> getMoreCharacters() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      page++;
      final charsRepo = await charactersRepo.getCharacters(page);
      charsRepo.fold(
        (failure) => null,
        (charactersResponse) {
          isLoadingMore = charactersResponse.info.next == null ? false : true;
          allCharacters.addAll(charactersResponse.characters);
          emit(CharactersSuccessState());
        },
      );
    }
  }

  Future<void> getQuotes() async {
    emit(QuotesLoadingState());
    final character = await charactersRepo.getQuotes();
    character.fold(
      (failure) => emit(QuotesErrorState(failure.errMessage)),
      (quote) {
        emit(QuotesSuccessState(quote));
      },
    );
  }

  void addSearchedItemToSearchedList(String searchedCharacter) {
    searchedForAllCharacters = allCharacters
        .where(
          (character) => character.name.toLowerCase().startsWith(searchedCharacter),
        )
        .toList();
  }
}
