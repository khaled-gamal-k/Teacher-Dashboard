import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/classes_model.dart';
import '../../data/models/student_model.dart';

part 'students_state.freezed.dart';

@freezed
abstract class StudentsState with _$StudentsState {
  const factory StudentsState({
    @Default([]) List<StudentModel> students,
    @Default([]) List<ClassesModel> classes,

    @Default(false) bool isLoading,

    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(0) int total,

    String? error,
  }) = _StudentsState;
}
