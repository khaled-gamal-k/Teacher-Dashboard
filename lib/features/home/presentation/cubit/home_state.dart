import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teacher_dashboard/shared/models/charts_model.dart';

import '../../data/models/dashboard_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    DashboardModel? stats,
    String? statsError,

    List<ChartsModel>? students,
    String? studentsError,

    List<ChartsModel>? attendance,
    String? attendanceError,

    List<ChartsModel>? performance,
    String? performanceError,

    // List<ExamModel>? exams,
    // String? examsError,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
