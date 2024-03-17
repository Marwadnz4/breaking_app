// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_app/core/web_services/failures.dart';
import 'package:breaking_app/core/web_services/web_services.dart';
import 'package:breaking_app/core/models/characters_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchCharactersRepo {
  final WebServices webServices;
  SearchCharactersRepo(this.webServices);

  Future<Either<Failure, CharactersResponse>> getFilterCharacters(Map<String, dynamic> queries) async {
    try {
      var data = await webServices.getFilterCharacters(queries);
      return right(data);
    } on Exception catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }
}
