import 'package:dartz/dartz.dart';

import '../../../../core/network/supabase_errors.dart';
import '../../../../shared/models/pagination_model.dart';
import '../models/add_student_model.dart';
import '../models/classes_model.dart';
import '../models/student_model.dart';

abstract class StudentsRepo {
  Future<Either<Failure, PaginationModel<StudentModel>>> getStudents({
    required int limit,
    required int offset,
    String? search,
  });

  Future<Either<Failure, List<ClassesModel>>> getClasses();

  Future<Either<Failure, Unit>> addStudent(AddStudentModel model);
}
