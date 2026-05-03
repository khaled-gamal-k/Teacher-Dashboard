import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../../core/network/supabase_errors.dart';

import '../models/dashboard_model.dart';

import '../../../../shared/models/charts_model.dart';

import '../../../../core/network/supabase_database_config.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final SupabaseDatabaseConfig _databaseService;

  HomeRepoImpl(this._databaseService);
  @override
  @override
  Future<Either<Failure, DashboardModel>> fetchDashboardStats() async {
    try {
      final res = await _databaseService.fetchRPC('get_dashboard_stats') ;
      final dashboardModel = DashboardModel.fromJson(res as Map<String, dynamic>);
      Logger().d(dashboardModel);
      return Right(dashboardModel);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<void> fetchLastExams() {
    // TODO: implement fetchLastExams
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChartsModel>>> fetchClassesPerformance() {
    // TODO: implement fetchClassesPerformance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChartsModel>>> fetchTodayAttendance() {
    // TODO: implement fetchTodayAttendance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChartsModel>>> fetchTotalStudents() async {
    try {
      final res = await _databaseService.fetchRPC('get_students_growth') as List<dynamic>;
      final list = res.map((e) => ChartsModel.fromJson(e as Map<String, dynamic>)).toList();
      return Right(list);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }
}
