import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Todos {
  Todos(
      {required this.userId,
      required this.id, 
      required this.title,
      required this.completed});

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'completed')
  bool completed;

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  Map<String, dynamic> toJson() => _$TodosToJson(this);
}
