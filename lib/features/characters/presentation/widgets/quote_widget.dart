import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../data/repository/characters_repo.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(getIt<CharactersRepo>())..getQuotes(),
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is QuotesSuccessState) {
            int randomIndex = Random().nextInt(20 - 1);
            String quote = state.quote[randomIndex].quote;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText(
                    quote,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 7,
                          color: AppColors.yellow,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return loading();
          }
        },
      ),
    );
  }
}
