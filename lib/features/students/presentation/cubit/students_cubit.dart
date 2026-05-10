import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/add_student_model.dart';
import '../../data/repos/students_repo.dart';
import 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  final StudentsRepo _repo;

  StudentsCubit(this._repo) : super(const StudentsState());

  static const _limit = 10;

  int _page = 1;
  String _search = '';

  Future<void> init() async {
    await getStudents();
    await getClasses();
  }

  Future<void> getStudents({bool reset = false}) async {
    if (reset) {
      _page = 1;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _repo.getStudents(
      limit: _limit,
      offset: (_page - 1) * _limit,
      search: _search,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (data) {
        final totalPages = (data.total / _limit).ceil();

        emit(
          state.copyWith(
            isLoading: false,
            students: data.data,
            total: data.total,
            totalPages: totalPages,
            currentPage: _page,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> search(String query) async {
    _search = query;

    await getStudents(reset: true);
  }

  Future<void> nextPage() async {
    if (_page >= state.totalPages) return;

    _page++;

    await getStudents();
  }

  Future<void> previousPage() async {
    if (_page <= 1) return;

    _page--;

    await getStudents();
  }

  Future<void> addStudent(AddStudentModel model) async {
    final result = await _repo.addStudent(model);
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (data) async => await getStudents(reset: true),
    );
  }

  Future<void> getClasses() async {
    final result = await _repo.getClasses();
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (data) => emit(state.copyWith(classes: data)),
    );
  }
}
