import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: '$title: ',
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: title.length * 9,
          child: const Divider(
            color: AppColors.yellow,
            height: 30,
            thickness: 2,
          ),
        )
      ],
    );
  }
}
