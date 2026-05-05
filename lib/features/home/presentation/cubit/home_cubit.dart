import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

  HomeCubit(this._repo) : super(const HomeState());

  void init() {
    loadStats();
    loadStudents();
    loadAttendance();
    loadPerformance();
    loadLastExams();
  }

  Future<void> loadStats() async {
    final result = await _repo.fetchDashboardStats();

    result.fold(
      (failure) => emit(state.copyWith(statsError: failure.message)),
      (data) => emit(state.copyWith(stats: data)),
    );
  }

  Future<void> loadStudents() async {
    final result = await _repo.fetchTotalStudents();

    result.fold(
      (failure) => emit(state.copyWith(studentsError: failure.message)),
      (data) => emit(state.copyWith(students: data)),
    );
  }

  Future<void> loadAttendance() async {
    final result = await _repo.fetchTodayAttendance();

    result.fold(
      (failure) => emit(state.copyWith(attendanceError: failure.message)),
      (data) => emit(state.copyWith(attendance: data)),
    );
  }

  Future<void> loadPerformance() async {
    final result = await _repo.fetchClassesPerformance();

    result.fold(
      (failure) => emit(state.copyWith(performanceError: failure.message)),
      (data) => emit(state.copyWith(performance: data)),
    );
  }

  Future<void> loadLastExams() async {
    final result = await _repo.fetchLastExams();

    result.fold(
      (failure) => emit(state.copyWith(examsError: failure.message)),
      (data) => emit(state.copyWith(exams: data)),
    );
  }
}
