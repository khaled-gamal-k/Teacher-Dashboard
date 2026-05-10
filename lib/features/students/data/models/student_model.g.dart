// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
  id: json['id'] as String?,
  studentName: json['student_name'] as String?,
  studentNumber: json['student_number'] as String?,
  studentClass: json['student_class'] as String?,
  attendancePercentage: (json['attendance_percentage'] as num?)?.toDouble(),
  avgScore: (json['avg_score'] as num?)?.toDouble(),
);
