import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import 'package:teacher_dashboard/core/network/supabase_errors.dart';

import 'package:teacher_dashboard/features/home/data/models/dashboard_model.dart';

import 'package:teacher_dashboard/shared/models/charts_model.dart';

import '../../../../core/network/supabase_database_config.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final SupabaseDatabaseConfig _databaseService;

  HomeRepoImpl(this._databaseService);
  @override
  @override
  Future<Either<Failure, DashboardModel>> fetchDashboardStats() async {
    try {
      final res = await _databaseService.fetchRPC('get_dashboard_stats');
      final dashboardModel = DashboardModel.fromJson(res);
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
  Future<Either<Failure, List<ChartsModel>>> fetchTotalStudents() {
    // TODO: implement fetchTotalStudents
    throw UnimplementedError();
  }
}
