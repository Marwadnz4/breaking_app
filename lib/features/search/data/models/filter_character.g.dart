// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCharacter _$FilterCharacterFromJson(Map<String, dynamic> json) =>
    FilterCharacter(
      page: json['page'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$FilterCharacterToJson(FilterCharacter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'page': instance.page,
    };
