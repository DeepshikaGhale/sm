import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'container.g.dart';

@JsonSerializable()
class DataContainer{

  DataContainer({required this.todos});

  List<Todos> todos;

  factory DataContainer.fromJson(Map<String, dynamic> json) => _$DataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$DataContainerToJson(this);


}