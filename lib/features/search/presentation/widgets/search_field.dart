import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final String labelText;
  const SearchField({super.key, required this.searchController, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: searchController,
        cursorColor: AppColors.gray,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.gray,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.gray,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.yellow,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.gray,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
