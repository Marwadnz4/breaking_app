import 'package:breaking_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({super.key, required this.items, this.onChanged, required this.value});

  final List items;
  final void Function(String?)? onChanged;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                ),
              ),
            )
            .toList() as List<DropdownMenuItem<String>>?,
        onChanged: onChanged,
        decoration: InputDecoration(
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
