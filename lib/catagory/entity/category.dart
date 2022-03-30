import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';


@JsonSerializable()
class CategoryDetails {
  @JsonKey(name: "id", defaultValue: 0, includeIfNull: true)
  final int id;
  
  @JsonKey(name: "backgroundImage", defaultValue: '', includeIfNull: true)
  final String backgroundImage;
  
  @JsonKey(name: "title", defaultValue: '', includeIfNull: true)
  final String title;

  @JsonKey(name: "description", defaultValue: '', includeIfNull: true)
  final String description;

  CategoryDetails({
    required this.id,
    required this.backgroundImage,
    required this.title,
    required this.description,  
  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) => _$CategoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}