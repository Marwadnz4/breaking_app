// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_app/core/web_services/failures.dart';
import 'package:breaking_app/core/web_services/web_services.dart';
import 'package:breaking_app/core/models/characters_response.dart';
import 'package:breaking_app/features/characters/data/models/quote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CharactersRepo {
  final WebServices webServices;
  final WebServicesForQuotes webServicesForQuotes;
  CharactersRepo(this.webServices, this.webServicesForQuotes);

  Future<Either<Failure, CharactersResponse>> getCharacters(int page) async {
    try {
      var data = await webServices.getCharacters(page);
      return right(data);
    } on Exception catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }

  Future<Either<Failure, List<Quote>>> getQuotes() async {
    try {
      var data = await webServicesForQuotes.getQuotes();
      return right(data);
    } on Exception catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }
}
