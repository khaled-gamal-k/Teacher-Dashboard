import 'package:dartz/dartz.dart';

import '../../../../core/network/supabase_errors.dart';
import '../../../../shared/models/charts_model.dart';
import '../models/class_performance_model.dart';
import '../models/dashboard_model.dart';
import '../models/last_exams_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, DashboardModel>> fetchDashboardStats();
  Future<Either<Failure, List<ChartsModel>>> fetchStudentsGrowth();
  Future<Either<Failure, List<ChartsModel>>> fetchAttendancePerMonth();
  Future<Either<Failure, List<ClassPerformanceModel>>> fetchClassesPerformance();
  Future<Either<Failure, List<LastExamsModel>>> fetchLastExams();
}
