import 'package:dartz/dartz.dart';
import 'package:teacher_dashboard/features/home/data/models/dashboard_model.dart';
import 'package:teacher_dashboard/shared/models/charts_model.dart';

import '../../../../core/network/supabase_errors.dart';

abstract class HomeRepo {
  Future<Either<Failure, DashboardModel>> fetchDashboardStats();
  Future<Either<Failure, List<ChartsModel>>> fetchTotalStudents();
  Future<Either<Failure, List<ChartsModel>>> fetchTodayAttendance();
  Future<Either<Failure, List<ChartsModel>>> fetchClassesPerformance();
  Future<void> fetchLastExams();
}
