// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_exams_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastExamsModel _$LastExamsModelFromJson(Map<String, dynamic> json) =>
    LastExamsModel(
      examId: json['exam_id'] as String?,
      examName: json['exam_name'] as String?,
      className: json['class_name'] as String?,
      classTime: json['class_time'] as String?,
      examDate: json['exam_date'] as String?,
      avgScore: (json['avg_score'] as num?)?.toDouble(),
    );
