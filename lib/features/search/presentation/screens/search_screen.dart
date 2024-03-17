import '../../../../core/widgets/build_loaded_list.dart';
import '../../logic/search_characters.dart';
import '../widgets/search_field_in_appbar.dart';
import '../widgets/alert_dialog.dart';

import '../../../../core/widgets/widgets.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/search_characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        leading: const BackButton(
          color: AppColors.gray,
        ),
        title: const SearchFieldInAppBar(),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showDialog(
        //         context: context,
        //         builder: (context) => const AlertDialogWidget(),
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.filter_list,
        //       color: AppColors.gray,
        //     ),
        //   ),
        // ],
      ),
      body: offline(
        BlocBuilder<SearchCharacterCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchCharactersSuccessState) {
              return BuildLoadedList(
                isLoadingMore: context.read<SearchCharacterCubit>().isSearchingMore,
                allCharacters: context.read<SearchCharacterCubit>().searchedCharacters,
                scrollController: context.read<SearchCharacterCubit>().searchScrollController,
              );
            } else if (state is SearchCharactersLoadingState) {
              return loading();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
