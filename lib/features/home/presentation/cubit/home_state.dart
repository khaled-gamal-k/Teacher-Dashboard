import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/last_exams_model.dart';
import '../../../../shared/models/charts_model.dart';

import '../../data/models/class_performance_model.dart';
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

    List<ClassPerformanceModel>? performance,
    String? performanceError,

    List<LastExamsModel>? exams,
    String? examsError,
  }) = _HomeState;
}
