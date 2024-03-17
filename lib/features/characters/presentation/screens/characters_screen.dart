import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/widgets.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';
import '../../../../core/widgets/build_loaded_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Characters',
          style: TextStyle(
            color: AppColors.gray,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.searchScreen);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
      body: offline(
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersSuccessState) {
              return BuildLoadedList(
                isLoadingMore: context.read<CharactersCubit>().isLoadingMore,
                allCharacters: context.read<CharactersCubit>().allCharacters,
                scrollController: context.read<CharactersCubit>().scrollController,
                );
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }
}
