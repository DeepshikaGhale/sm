// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataContainer _$DataContainerFromJson(Map<String, dynamic> json) =>
    DataContainer(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => Todos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataContainerToJson(DataContainer instance) =>
    <String, dynamic>{
      'todos': instance.todos,
    };
