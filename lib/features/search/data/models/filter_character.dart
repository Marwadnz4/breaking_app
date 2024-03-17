// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'filter_character.g.dart';

@JsonSerializable()
class FilterCharacter {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int? page;

  FilterCharacter({
    required this.page,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });

  Map<String, dynamic> toJson() => _$FilterCharacterToJson(this);
}
