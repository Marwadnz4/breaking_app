import '../../../core/models/character.dart';
import '../data/models/filter_character.dart';
import '../data/repository/characters_repo.dart';
import 'search_characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCharacterCubit extends Cubit<SearchState> {
  final SearchCharactersRepo searchCharactersRepo;
  SearchCharacterCubit(this.searchCharactersRepo) : super(SearchInitialState()) {
    searchScrollController.addListener(() {
      searchForMoreCharacters();
    });
  }
  ScrollController searchScrollController = ScrollController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  int searchPage = 1;
  bool isSearchingMore = false;
  List<Character> searchedCharacters = [];

  List genderList = ['female', 'male', 'unknown'];

  List statusList = ['alive', 'dead', 'unknown'];
  
  String status = 'alive';
  String gender = 'female';

  FilterCharacter getFilterCharacter() {
    return FilterCharacter(
      page: searchPage,
      // species: species,
      status: statusList.first,
      // type: type,
      gender: gender,
    );
  }

  int count = 0;
  void searchForCharactersByName() async {
    if (count == 0) {
      emit(SearchCharactersLoadingState());
      count++;
    }
    final charsRepo = await searchCharactersRepo.getFilterCharacters({
      'page': searchPage,
      'name': nameController.text,
    });
    charsRepo.fold(
      (failure) => emit(SearchCharactersErrorState(failure.errMessage)),
      (charactersResponse) {
        isSearchingMore = charactersResponse.info.next == null ? false : true;
        searchedCharacters.addAll(charactersResponse.characters);
        emit(SearchCharactersSuccessState());
      },
    );
  }

  Future<void> searchForMoreCharacters() async {
    if (searchScrollController.position.pixels == searchScrollController.position.maxScrollExtent) {
      searchPage++;
    }
    searchForCharactersByName();
  }
}
