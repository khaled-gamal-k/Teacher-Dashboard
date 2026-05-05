import 'package:json_annotation/json_annotation.dart';

part 'last_exams_model.g.dart';

@JsonSerializable(createToJson: false)
class LastExamsModel {
  @JsonKey(name: 'exam_id')
  final String? examId;
  @JsonKey(name: 'exam_name')
  final String? examName;
  @JsonKey(name: 'class_name')
  final String? className;
  @JsonKey(name: 'class_time')
  final String? classTime;
  @JsonKey(name: 'exam_date')
  final String? examDate;
  @JsonKey(name: 'avg_score')
  final double? avgScore;

  LastExamsModel({
    this.examId,
    this.examName,
    this.className,
    this.classTime,
    this.examDate,
    this.avgScore,
  });

  factory LastExamsModel.fromJson(Map<String, dynamic> json) => _$LastExamsModelFromJson(json);
}
