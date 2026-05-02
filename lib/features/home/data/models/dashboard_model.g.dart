// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      studentsCount: (json['students_count'] as num).toInt(),
      classesCount: (json['classes_count'] as num).toInt(),
      attendanceToday: (json['attendance_today'] as num).toInt(),
      revenue: (json['monthly_revenue'] as num).toDouble(),
      avgScore: (json['avg_score'] as num).toDouble(),
    );
