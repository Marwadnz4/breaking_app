import '../../features/search/data/repository/characters_repo.dart';
import '../../features/search/logic/search_characters.dart';

import '../web_services/dio_factory.dart';
import '../web_services/web_services.dart';
import '../../features/characters/logic/characters_cubit.dart';
import '../../features/characters/data/repository/characters_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WebServices>(() => WebServices(dio));
  getIt.registerLazySingleton<WebServicesForQuotes>(() => WebServicesForQuotes(dio));

  getIt.registerLazySingleton<CharactersRepo>(() => CharactersRepo(getIt<WebServices>(), getIt<WebServicesForQuotes>()));
  getIt.registerFactory<CharactersCubit>(() => CharactersCubit(getIt()));

  getIt.registerLazySingleton<SearchCharactersRepo>(() => SearchCharactersRepo(getIt<WebServices>()));
  getIt.registerFactory<SearchCharacterCubit>(() => SearchCharacterCubit(getIt<SearchCharactersRepo>()));
}