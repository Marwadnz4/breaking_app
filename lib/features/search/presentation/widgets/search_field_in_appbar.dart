import '../../logic/search_characters.dart';

import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFieldInAppBar extends StatelessWidget {
  const SearchFieldInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: context.read<SearchCharacterCubit>().nameController,
        cursorColor: AppColors.gray,
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.gray,
        ),
        decoration: InputDecoration(
          hintText: 'Find a character',
          hintStyle: TextStyle(
            fontSize: 15,
            color: AppColors.gray.withOpacity(.6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.gray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.gray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.gray,
            ),
          ),
          isDense: true,
          suffixIcon: IconButton(
            onPressed: () {
              context.read<SearchCharacterCubit>().nameController.clear();
            },
            icon: const Icon(
              Icons.clear,
              color: AppColors.gray,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          filled: true,
          fillColor: AppColors.yellow,
        ),
        onSubmitted: (value) {
          context.read<SearchCharacterCubit>().searchForCharactersByName();
        },
      ),
    );
  }
}
