import 'package:json_annotation/json_annotation.dart';

part 'add_student_model.g.dart';

@JsonSerializable(createFactory: false)
class AddStudentModel {
  @JsonKey(name: 'p_name')  
  final String name;
  @JsonKey(name: 'p_phone')
  final String number;
  @JsonKey(name: 'p_parent_phone')
  final String parentNumber;
  @JsonKey(name: 'p_class_id')
  final String classId;

  AddStudentModel({
    required this.name,
    required this.number,
    required this.parentNumber,
    required this.classId,
  });

  Map<String, dynamic> toJson() => _$AddStudentModelToJson(this);
}
