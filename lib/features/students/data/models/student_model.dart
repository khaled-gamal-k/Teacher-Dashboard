import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable(createToJson: false)
class StudentModel {
  final String? id;
  @JsonKey(name: 'student_name')
  final String? studentName;
  @JsonKey(name: 'student_number')
  final String? studentNumber;
  @JsonKey(name: 'student_class')
  final String? studentClass;
  @JsonKey(name: 'attendance_percentage')
  final double? attendancePercentage;
  @JsonKey(name: 'avg_score')
  final double? avgScore;

  StudentModel({
    this.id,
    this.studentName,
    this.studentNumber,
    this.studentClass,
    this.attendancePercentage,
    this.avgScore,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}
