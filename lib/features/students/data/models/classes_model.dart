import 'package:json_annotation/json_annotation.dart';

part 'classes_model.g.dart';

@JsonSerializable(createToJson: false)
class ClassesModel {
  final String? id;
  final String? name;

  const ClassesModel({this.id, this.name});

  factory ClassesModel.fromJson(Map<String, dynamic> json) => _$ClassesModelFromJson(json);
}
