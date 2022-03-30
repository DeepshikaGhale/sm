import 'package:json_annotation/json_annotation.dart';
import 'package:todos/catagory/entity/category.dart';

part 'category_list.g.dart';

@JsonSerializable()
class CategoryContainer{
  @JsonKey(name: "data", includeIfNull: true)
  final List<CategoryDetails> categoryDetailsList;

  CategoryContainer({required this.categoryDetailsList});

  factory CategoryContainer.fromJson(Map<String, dynamic> json) => _$CategoryContainerFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryContainerToJson(this);

}