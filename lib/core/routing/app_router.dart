import '../../features/search/logic/search_characters.dart';
import '../../features/search/presentation/screens/search_screen.dart';


import '../di/dependency_injection.dart';
import 'routes.dart';
import '../../features/characters/logic/characters_cubit.dart';
import '../models/character.dart';
import '../../features/characters/presentation/screens/characters_details_screen.dart';
import '../../features/characters/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CharactersCubit>()..getCharacters(),
            child: const CharactersScreen(),
          ),
        );
      case Routes.charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder:(_)  => CharactersDetailsScreen(character: character),
          
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchCharacterCubit>(),
            child: const SearchScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
