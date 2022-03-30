// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) =>
    CategoryDetails(
      id: json['id'] as int? ?? 0,
      backgroundImage: json['backgroundImage'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryDetailsToJson(CategoryDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backgroundImage': instance.backgroundImage,
      'title': instance.title,
      'description': instance.description,
    };
