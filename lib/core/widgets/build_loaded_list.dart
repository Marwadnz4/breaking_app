import '../models/character.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import '../theming/colors.dart';
import '../../features/characters/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';

class BuildLoadedList extends StatelessWidget {
  const BuildLoadedList({
    super.key,
    required this.allCharacters,
    required this.scrollController,
    required this.isLoadingMore,
  });
  final ScrollController scrollController;
  final List<Character> allCharacters;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: isLoadingMore ? allCharacters.length + 2 : allCharacters.length,
        itemBuilder: (context, index) {
          if (index >= allCharacters.length) {
            return ShimmerPro.sized(
              light: ShimmerProLight.lighter,
              scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
              height: 210,
              width: 150,
              borderRadius: 5,
            );
          } else {
            return CharacterItem(
              character: allCharacters[index],
            );
          }
        },
      ),
    );
  }
}
