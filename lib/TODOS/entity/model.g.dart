// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map<String, dynamic> json) => Todos(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$TodosToJson(Todos instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
