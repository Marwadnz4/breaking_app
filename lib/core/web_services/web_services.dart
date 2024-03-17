import 'package:retrofit/http.dart';

import 'web_services_strings.dart';
import '../models/characters_response.dart';
import '../../features/characters/data/models/quote.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: WebServicesString.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET(WebServicesString.charactersEP)
  Future<CharactersResponse> getCharacters(@Query('page') int page);

  @GET(WebServicesString.charactersEP)
  Future<CharactersResponse> getFilterCharacters(@Queries() Map<String, dynamic> queries);

}

@RestApi(baseUrl: WebServicesString.baseUrlForQuotes)
abstract class WebServicesForQuotes {
  factory WebServicesForQuotes(Dio dio, {String baseUrl}) = _WebServicesForQuotes;

  @GET(WebServicesString.quotesEP)
  Future<List<Quote>> getQuotes();
}