// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_app/core/models/character.dart';
import 'package:json_annotation/json_annotation.dart';
part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
final Info info;
@JsonKey(name: 'results')
final List<Character> characters;
  CharactersResponse({
    required this.info,
    required this.characters,
  });
    factory CharactersResponse.fromJson(Map<String, dynamic> json) => _$CharactersResponseFromJson(json);

}

@JsonSerializable()
class Info {
    final int count;
    final int pages;
    final String? next;
    final String? prev;
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  }
