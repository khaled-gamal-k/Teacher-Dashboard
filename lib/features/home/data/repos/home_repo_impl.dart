import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../models/class_performance_model.dart';

import '../../../../core/constants/supabase_constants.dart';
import '../../../../core/network/supabase_errors.dart';

import '../models/dashboard_model.dart';

import '../../../../shared/models/charts_model.dart';

import '../../../../core/network/supabase_database_config.dart';
import '../models/last_exams_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final SupabaseDatabaseConfig _databaseService;

  HomeRepoImpl(this._databaseService);
  @override
  Future<Either<Failure, DashboardModel>> fetchDashboardStats() async {
    try {
      final res = await _databaseService.fetchRPC(SupabaseConstants.getDashboardStats);
      final dashboardModel = DashboardModel.fromJson(res as Map<String, dynamic>);
      Logger().d(dashboardModel);
      return Right(dashboardModel);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<LastExamsModel>>> fetchLastExams() async {
    try {
      final res = await _databaseService.fetchRPC(SupabaseConstants.getExams) as List<dynamic>;
      final list = res.map((e) => LastExamsModel.fromJson(e as Map<String, dynamic>)).toList();
      return Right(list);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<ClassPerformanceModel>>> fetchClassesPerformance() async {
    try {
      final res =
          await _databaseService.fetchRPC(SupabaseConstants.getClassesPerformance) as List<dynamic>;
      final list = res
          .map((e) => ClassPerformanceModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<ChartsModel>>> fetchAttendancePerMonth() async {
    try {
      final res =
          await _databaseService.fetchRPC(SupabaseConstants.getAttendancePerMonth) as List<dynamic>;
      final list = res.map((e) => ChartsModel.fromJson(e as Map<String, dynamic>)).toList();
      return Right(list);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<ChartsModel>>> fetchStudentsGrowth() async {
    try {
      final res =
          await _databaseService.fetchRPC(SupabaseConstants.getStudentsGrowth) as List<dynamic>;
      final list = res.map((e) => ChartsModel.fromJson(e as Map<String, dynamic>)).toList();
      return Right(list);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }
}
