// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryContainer _$CategoryContainerFromJson(Map<String, dynamic> json) =>
    CategoryContainer(
      categoryDetailsList: (json['data'] as List<dynamic>)
          .map((e) => CategoryDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryContainerToJson(CategoryContainer instance) =>
    <String, dynamic>{
      'data': instance.categoryDetailsList,
    };
