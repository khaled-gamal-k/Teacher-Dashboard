import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(createToJson: false)
class DashboardModel {
  @JsonKey(name: 'students_count')
  final int studentsCount;
  @JsonKey(name: 'classes_count')
  final int classesCount;
  @JsonKey(name: 'attendance_today')
  final int attendanceToday;
  @JsonKey(name: 'monthly_revenue')
  final double revenue;
  @JsonKey(name: 'avg_score')
  final double avgScore;

  DashboardModel({
    required this.studentsCount,
    required this.classesCount,
    required this.attendanceToday,
    required this.revenue,
    required this.avgScore,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
}
