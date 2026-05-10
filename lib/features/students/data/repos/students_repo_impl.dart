import 'package:dartz/dartz.dart';
import 'package:teacher_dashboard/core/constants/supabase_constants.dart';
import 'package:teacher_dashboard/core/network/supabase_database_config.dart';

import 'package:teacher_dashboard/core/network/supabase_errors.dart';
import 'package:teacher_dashboard/features/students/data/models/add_student_model.dart';
import 'package:teacher_dashboard/features/students/data/models/classes_model.dart';

import 'package:teacher_dashboard/features/students/data/models/student_model.dart';

import 'package:teacher_dashboard/shared/models/pagination_model.dart';

import 'students_repo.dart';

class StudentsRepoImpl implements StudentsRepo {
  final SupabaseDatabaseConfig _databaseService;

  StudentsRepoImpl(this._databaseService);
  @override
  Future<Either<Failure, PaginationModel<StudentModel>>> getStudents({
    required int limit,
    required int offset,
    String? search,
  }) async {
    try {
      final res = await _databaseService.fetchRPCWithParams(
        SupabaseConstants.getStudentsTable,
        params: {'p_limit': limit, 'p_offset': offset, 'p_search': search},
      );

      final data = PaginationModel<StudentModel>.fromJson(
        res,
        (json) => StudentModel.fromJson(json as Map<String, dynamic>),
      );

      return Right(data);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  @override
  Future<Either<Failure, Unit>> addStudent(AddStudentModel model) async {
    try {
      await _databaseService.fetchRPCWithParams(
        'create_student_with_enrollment',
        params: model.toJson(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<ClassesModel>>> getClasses() async {
    try {
      final res = await _databaseService.getData(tableName: SupabaseConstants.classesTable);
      final data = res.map((e) => ClassesModel.fromJson(e)).toList();
      return Right(data);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }
}
